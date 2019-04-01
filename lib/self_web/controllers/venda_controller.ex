defmodule SelfWeb.VendaController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.Venda

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    vendas = Movimentacao.list_vendas()
    render(conn, "index.html", vendas: vendas)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_venda(%Venda{})
    funcionarios = Self.Ator.select_funcionarios
    clientes = Self.Ator.select_clientes
    render(conn, "new.html", changeset: changeset, funcionarios: funcionarios, clientes: clientes)
  end

  def create(conn, %{"venda" => venda_params}) do
    case Movimentacao.create_venda(venda_params) do
      {:ok, venda} ->
        conn
        |> put_flash(:info, "Venda criado com sucesso.")
        |> redirect(to: Routes.venda_path(conn, :show, venda))

      {:error, %Ecto.Changeset{} = changeset} ->
        funcionarios = Self.Ator.select_funcionarios
        clientes = Self.Ator.select_clientes
        render(conn, "new.html", changeset: changeset, funcionarios: funcionarios, clientes: clientes)
    end
  end

  def show(conn, %{"id" => id}) do
    venda = Movimentacao.get_venda!(id)
    render(conn, "show.html", venda: venda)
  end

  def edit(conn, %{"id" => id}) do
    venda = Movimentacao.get_venda!(id)
    changeset = Movimentacao.change_venda(venda)
    funcionarios = Self.Ator.select_funcionarios
    clientes = Self.Ator.select_clientes
    render(conn, "edit.html", venda: venda, changeset: changeset, funcionarios: funcionarios, clientes: clientes)
  end

  def update(conn, %{"id" => id, "venda" => venda_params}) do
    venda = Movimentacao.get_venda!(id)

    case Movimentacao.update_venda(venda, venda_params) do
      {:ok, venda} ->
        conn
        |> put_flash(:info, "Venda atualizado com sucesso.")
        |> redirect(to: Routes.venda_path(conn, :show, venda))

      {:error, %Ecto.Changeset{} = changeset} ->
        funcionarios = Self.Ator.select_funcionarios
        clientes = Self.Ator.select_clientes
        render(conn, "edit.html", venda: venda, changeset: changeset, funcionarios: funcionarios, clientes: clientes)
    end
  end

  def delete(conn, %{"id" => id}) do
    venda = Movimentacao.get_venda!(id)
    {:ok, _venda} = Movimentacao.delete_venda(venda)

    conn
    |> put_flash(:info, "Venda excluido com sucesso.")
    |> redirect(to: Routes.venda_path(conn, :index))
  end
end
