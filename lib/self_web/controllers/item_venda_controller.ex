defmodule SelfWeb.ItemVendaController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.ItemVenda

  def index(conn, _params) do
    itens_venda = Movimentacao.list_itens_venda()
    render(conn, "index.html", itens_venda: itens_venda)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_item_venda(%ItemVenda{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item_venda" => item_venda_params}) do
    case Movimentacao.create_item_venda(item_venda_params) do
      {:ok, item_venda} ->
        conn
        |> put_flash(:info, "Item venda created successfully.")
        |> redirect(to: Routes.item_venda_path(conn, :show, item_venda))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item_venda = Movimentacao.get_item_venda!(id)
    render(conn, "show.html", item_venda: item_venda)
  end

  def edit(conn, %{"id" => id}) do
    item_venda = Movimentacao.get_item_venda!(id)
    changeset = Movimentacao.change_item_venda(item_venda)
    render(conn, "edit.html", item_venda: item_venda, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item_venda" => item_venda_params}) do
    item_venda = Movimentacao.get_item_venda!(id)

    case Movimentacao.update_item_venda(item_venda, item_venda_params) do
      {:ok, item_venda} ->
        conn
        |> put_flash(:info, "Item venda updated successfully.")
        |> redirect(to: Routes.item_venda_path(conn, :show, item_venda))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item_venda: item_venda, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_venda = Movimentacao.get_item_venda!(id)
    {:ok, _item_venda} = Movimentacao.delete_item_venda(item_venda)

    conn
    |> put_flash(:info, "Item venda deleted successfully.")
    |> redirect(to: Routes.item_venda_path(conn, :index))
  end
end
