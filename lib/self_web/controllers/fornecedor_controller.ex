defmodule SelfWeb.FornecedorController do
  use SelfWeb, :controller

  alias Self.Ator
  alias Self.Ator.Fornecedor
  alias Self.Localizacao

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    fornecedores = Ator.list_fornecedores()
    render(conn, "index.html", fornecedores: fornecedores)
  end

  def new(conn, _params) do
    changeset = Ator.change_fornecedor(%Fornecedor{})
    enderecos = Localizacao.select_enderecos()
    render(conn, "new.html", changeset: changeset, enderecos: enderecos)
  end

  def create(conn, %{"fornecedor" => fornecedor_params}) do
    case Ator.create_fornecedor(fornecedor_params) do
      {:ok, fornecedor} ->
        conn
        |> put_flash(:info, "Fornecedor criado com sucesso.")
        |> redirect(to: Routes.fornecedor_path(conn, :show, fornecedor))

      {:error, %Ecto.Changeset{} = changeset} ->
        enderecos = Localizacao.select_enderecos()
        render(conn, "new.html", changeset: changeset, enderecos: enderecos)
    end
  end

  def show(conn, %{"id" => id}) do
    fornecedor = Ator.get_fornecedor!(id)
    render(conn, "show.html", fornecedor: fornecedor)
  end

  def edit(conn, %{"id" => id}) do
    fornecedor = Ator.get_fornecedor!(id)
    changeset = Ator.change_fornecedor(fornecedor)
    enderecos = Localizacao.select_enderecos()
    render(conn, "edit.html", fornecedor: fornecedor, changeset: changeset, enderecos: enderecos)
  end

  def update(conn, %{"id" => id, "fornecedor" => fornecedor_params}) do
    fornecedor = Ator.get_fornecedor!(id)

    case Ator.update_fornecedor(fornecedor, fornecedor_params) do
      {:ok, fornecedor} ->
        conn
        |> put_flash(:info, "Fornecedor atualizado com sucesso.")
        |> redirect(to: Routes.fornecedor_path(conn, :show, fornecedor))

      {:error, %Ecto.Changeset{} = changeset} ->
        enderecos = Localizacao.select_enderecos()
        render(conn, "edit.html", fornecedor: fornecedor, changeset: changeset, enderecos: enderecos)
    end
  end

  def delete(conn, %{"id" => id}) do
    fornecedor = Ator.get_fornecedor!(id)
    {:ok, _fornecedor} = Ator.delete_fornecedor(fornecedor)

    conn
    |> put_flash(:info, "Fornecedor excluido com sucesso.")
    |> redirect(to: Routes.fornecedor_path(conn, :index))
  end
end
