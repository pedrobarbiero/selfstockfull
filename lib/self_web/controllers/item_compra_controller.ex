defmodule SelfWeb.ItemCompraController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.ItemCompra

  def index(conn, _params) do
    itens_compra = Movimentacao.list_itens_compra()
    render(conn, "index.html", itens_compra: itens_compra)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_item_compra(%ItemCompra{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item_compra" => item_compra_params}) do
    case Movimentacao.create_item_compra(item_compra_params) do
      {:ok, item_compra} ->
        conn
        |> put_flash(:info, "Item compra created successfully.")
        |> redirect(to: Routes.item_compra_path(conn, :show, item_compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    render(conn, "show.html", item_compra: item_compra)
  end

  def edit(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    changeset = Movimentacao.change_item_compra(item_compra)
    render(conn, "edit.html", item_compra: item_compra, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item_compra" => item_compra_params}) do
    item_compra = Movimentacao.get_item_compra!(id)

    case Movimentacao.update_item_compra(item_compra, item_compra_params) do
      {:ok, item_compra} ->
        conn
        |> put_flash(:info, "Item compra updated successfully.")
        |> redirect(to: Routes.item_compra_path(conn, :show, item_compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item_compra: item_compra, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    {:ok, _item_compra} = Movimentacao.delete_item_compra(item_compra)

    conn
    |> put_flash(:info, "Item compra deleted successfully.")
    |> redirect(to: Routes.item_compra_path(conn, :index))
  end
end
