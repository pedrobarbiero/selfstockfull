defmodule SelfWeb.CompraController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.Compra

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    compras = Movimentacao.list_compras()
    render(conn, "index.html", compras: compras)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_compra(%Compra{})
    funcionarios = Self.Ator.select_funcionarios
    fornecedores = Self.Ator.select_fornecedores
    render(conn, "new.html", changeset: changeset, funcionarios: funcionarios, fornecedores: fornecedores )
  end

  def create(conn, %{"compra" => compra_params}) do
    case Movimentacao.create_compra(compra_params) do
      {:ok, compra} ->
        conn
        |> put_flash(:info, "Compra inserida com sucesso.")
        |> redirect(to: Routes.compra_path(conn, :show, compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        funcionarios = Self.Ator.select_funcionarios
        fornecedores = Self.Ator.select_fornecedores
        render(conn, "new.html", changeset: changeset, funcionarios: funcionarios, fornecedores: fornecedores)
    end
  end

  def show(conn, %{"id" => id}) do
    compra = Movimentacao.get_compra!(id)
    render(conn, "show.html", compra: compra)
  end

  def edit(conn, %{"id" => id}) do
    compra = Movimentacao.get_compra!(id)
    changeset = Movimentacao.change_compra(compra)
    funcionarios = Self.Ator.select_funcionarios
    fornecedores = Self.Ator.select_fornecedores
    render(conn, "edit.html", compra: compra, changeset: changeset, funcionarios: funcionarios, fornecedores: fornecedores)
  end

  def update(conn, %{"id" => id, "compra" => compra_params}) do
    compra = Movimentacao.get_compra!(id)

    case Movimentacao.update_compra(compra, compra_params) do
      {:ok, compra} ->
        conn
        |> put_flash(:info, "Compra atualizar com sucesso.")
        |> redirect(to: Routes.compra_path(conn, :show, compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        funcionarios = Self.Ator.select_funcionarios
        fornecedores = Self.Ator.select_fornecedores
        render(conn, "edit.html", compra: compra, changeset: changeset, funcionarios: funcionarios, fornecedores: fornecedores)
    end
  end

  def delete(conn, %{"id" => id}) do
    compra = Movimentacao.get_compra!(id)
    {:ok, _compra} = Movimentacao.delete_compra(compra)

    conn
    |> put_flash(:info, "Compra excluida com sucesso.")
    |> redirect(to: Routes.compra_path(conn, :index))
  end
end
