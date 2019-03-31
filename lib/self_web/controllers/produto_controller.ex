defmodule SelfWeb.ProdutoController do
  use SelfWeb, :controller

  alias Self.Estoque
  alias Self.Estoque.Produto

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    produtos = Estoque.list_produtos()
    render(conn, "index.html", produtos: produtos)
  end

  def new(conn, _params) do
    changeset = Estoque.change_produto(%Produto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"produto" => produto_params}) do
    case Estoque.create_produto(produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto created successfully.")
        |> redirect(to: Routes.produto_path(conn, :show, produto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    produto = Estoque.get_produto!(id)
    render(conn, "show.html", produto: produto)
  end

  def edit(conn, %{"id" => id}) do
    produto = Estoque.get_produto!(id)
    changeset = Estoque.change_produto(produto)
    render(conn, "edit.html", produto: produto, changeset: changeset)
  end

  def update(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Estoque.get_produto!(id)

    case Estoque.update_produto(produto, produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto updated successfully.")
        |> redirect(to: Routes.produto_path(conn, :show, produto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", produto: produto, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    produto = Estoque.get_produto!(id)
    {:ok, _produto} = Estoque.delete_produto(produto)

    conn
    |> put_flash(:info, "Produto deleted successfully.")
    |> redirect(to: Routes.produto_path(conn, :index))
  end
end
