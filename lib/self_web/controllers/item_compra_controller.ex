defmodule SelfWeb.ItemCompraController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.ItemCompra

  plug SelfWeb.Plug.RequireAuth
       when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    itens_compra = Movimentacao.list_itens_compra()
    render(conn, "index.html", itens_compra: itens_compra)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_item_compra(%ItemCompra{})
    compras = Self.Movimentacao.select_compras()
    produtos = Self.Estoque.select_produtos()
    render(conn, "new.html", changeset: changeset, compras: compras, produtos: produtos)
  end

  def create(conn, %{"item_compra" => item_compra_params}) do
    %{"compra_id" => compra_id} = item_compra_params

    case Movimentacao.create_item_compra(item_compra_params) do
      {:ok, _item_compra} ->
        compra = Movimentacao.get_compra!(compra_id)

        conn
        |> put_flash(:info, "Item compra criado com sucesso.")
        |> redirect(to: Routes.item_compra_path(conn, :compra, compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        produtos = Self.Estoque.select_produtos()
        itens_compra = Movimentacao.itens_by_compraid(compra_id)

        render(conn, "new.html",
          changeset: changeset,
          produtos: produtos,
          itens_compra: itens_compra
        )
    end
  end

  def show(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    render(conn, "show.html", item_compra: item_compra)
  end

  def edit(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    changeset = Movimentacao.change_item_compra(item_compra)
    compras = Self.Movimentacao.select_compras()
    produtos = Self.Estoque.select_produtos()

    render(conn, "edit.html",
      item_compra: item_compra,
      changeset: changeset,
      compras: compras,
      produtos: produtos
    )
  end

  def update(conn, %{"id" => id, "item_compra" => item_compra_params}) do
    item_compra = Movimentacao.get_item_compra!(id)

    case Movimentacao.update_item_compra(item_compra, item_compra_params) do
      {:ok, item_compra} ->
        conn
        |> put_flash(:info, "Item compra atualizado com sucesso.")
        |> redirect(to: Routes.item_compra_path(conn, :show, item_compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        compras = Self.Movimentacao.select_compras()
        produtos = Self.Estoque.select_produtos()

        render(conn, "edit.html",
          item_compra: item_compra,
          changeset: changeset,
          compras: compras,
          produtos: produtos
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    item_compra = Movimentacao.get_item_compra!(id)
    {:ok, _item_compra} = Movimentacao.delete_item_compra(item_compra)

    %{compra_id: compra_id} = item_compra
    compra = Movimentacao.get_compra!(compra_id)

    conn
    |> put_flash(:info, "Item compra excluido com sucesso.")
    |> redirect(to: Routes.item_compra_path(conn, :compra, compra))
  end

  def compra(conn, %{"id" => id}) do
    item_compra = %Movimentacao.ItemCompra{compra_id: String.to_integer(id)}
    changeset = Movimentacao.change_item_compra(item_compra)
    produtos = Self.Estoque.select_produtos()
    itens_compra = Self.Movimentacao.itens_by_compraid(id)
    render(conn, "new.html", changeset: changeset, produtos: produtos, itens_compra: itens_compra)
  end
end
