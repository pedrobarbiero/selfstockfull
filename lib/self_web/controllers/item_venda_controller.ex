defmodule SelfWeb.ItemVendaController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.ItemVenda

  plug SelfWeb.Plug.RequireAuth
       when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    itens_venda = Movimentacao.list_itens_venda()
    render(conn, "index.html", itens_venda: itens_venda)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_item_venda(%ItemVenda{})
    produtos = Self.Estoque.select_produtos()
    render(conn, "new.html", changeset: changeset, produtos: produtos)
  end

  def create(conn, %{"item_venda" => item_venda_params}) do
    %{"venda_id" => venda_id} = item_venda_params

    case Movimentacao.create_item_venda(item_venda_params) do
      {:ok, _item_venda} ->
        venda = Movimentacao.get_venda!(venda_id)

        conn
        |> put_flash(:info, "Item venda criado com sucesso.")
        |> redirect(to: Routes.item_venda_path(conn, :venda, venda))

      {:error, %Ecto.Changeset{} = changeset} ->
        produtos = Self.Estoque.select_produtos()
        itens_venda = Movimentacao.itens_by_vendaid(venda_id)

        render(conn, "new.html",
          changeset: changeset,
          produtos: produtos,
          itens_venda: itens_venda
        )
    end
  end

  def show(conn, %{"id" => id}) do
    item_venda = Movimentacao.get_item_venda!(id)
    render(conn, "show.html", item_venda: item_venda)
  end

  def edit(conn, %{"id" => id}) do
    item_venda = Movimentacao.get_item_venda!(id)
    changeset = Movimentacao.change_item_venda(item_venda)
    produtos = Self.Estoque.select_produtos()
    render(conn, "edit.html", item_venda: item_venda, changeset: changeset, produtos: produtos)
  end

  def update(conn, %{"id" => id, "item_venda" => item_venda_params}) do
    item_venda = Movimentacao.get_item_venda!(id)

    case Movimentacao.update_item_venda(item_venda, item_venda_params) do
      {:ok, item_venda} ->
        conn
        |> put_flash(:info, "Item venda atualizado com sucesso.")
        |> redirect(to: Routes.item_venda_path(conn, :show, item_venda))

      {:error, %Ecto.Changeset{} = changeset} ->
        produtos = Self.Estoque.select_produtos()

        render(conn, "edit.html", item_venda: item_venda, changeset: changeset, produtos: produtos)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_venda = Movimentacao.get_item_venda!(id)
    {:ok, _item_venda} = Movimentacao.delete_item_venda(item_venda)

    %{venda_id: venda_id} = item_venda
    venda = Movimentacao.get_venda!(venda_id)

    conn
    |> put_flash(:info, "Item venda excluido com sucesso.")
    |> redirect(to: Routes.item_venda_path(conn, :venda, venda))
  end

  def venda(conn, %{"id" => id}) do
    item_venda = %Movimentacao.ItemVenda{venda_id: String.to_integer(id)}
    changeset = Movimentacao.change_item_venda(item_venda)
    produtos = Self.Estoque.select_produtos()
    itens_venda = Self.Movimentacao.itens_by_vendaid(id)
    render(conn, "new.html", changeset: changeset, produtos: produtos, itens_venda: itens_venda)
  end
end
