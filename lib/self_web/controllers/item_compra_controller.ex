defmodule SelfWeb.ItemCompraController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.ItemCompra

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    itens_compra = Movimentacao.list_itens_compra()
    render(conn, "index.html", itens_compra: itens_compra)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_item_compra(%ItemCompra{})
    compras = Self.Movimentacao.select_compras
    produtos = Self.Estoque.select_produtos
    render(conn, "new.html", changeset: changeset, compras: compras, produtos: produtos)
  end

  def create(conn, %{"item_compra" => item_compra_params}) do
    case Movimentacao.create_item_compra(item_compra_params) do
      {:ok, item_compra} ->
        conn
        |> put_flash(:info, "Item compra criado com sucesso.")
        |> redirect(to: Routes.item_compra_path(conn, :show, item_compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        compras = Self.Movimentacao.select_compras
        produtos = Self.Estoque.select_produtos
        render(conn, "new.html", changeset: changeset, compras: compras, produtos: produtos)
    end
  end

  def show(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    render(conn, "show.html", item_compra: item_compra)
  end

  def edit(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    changeset = Movimentacao.change_item_compra(item_compra)
    compras = Self.Movimentacao.select_compras
    produtos = Self.Estoque.select_produtos
    render(conn, "edit.html", item_compra: item_compra, changeset: changeset, compras: compras, produtos: produtos)
  end

  def update(conn, %{"id" => id, "item_compra" => item_compra_params}) do
    item_compra = Movimentacao.get_item_compra!(id)

    case Movimentacao.update_item_compra(item_compra, item_compra_params) do
      {:ok, item_compra} ->
        conn
        |> put_flash(:info, "Item compra atualizado com sucesso.")
        |> redirect(to: Routes.item_compra_path(conn, :show, item_compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        compras = Self.Movimentacao.select_compras
        produtos = Self.Estoque.select_produtos
        render(conn, "edit.html", item_compra: item_compra, changeset: changeset, compras: compras, produtos: produtos)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    {:ok, _item_compra} = Movimentacao.delete_item_compra(item_compra)

    conn
    |> put_flash(:info, "Item compra excluido com sucesso.")
    |> redirect(to: Routes.item_compra_path(conn, :index))
  end
end
