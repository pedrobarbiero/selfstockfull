defmodule SelfWeb.CompraController do
  use SelfWeb, :controller

  alias Self.Movimentacao
  alias Self.Movimentacao.Compra

  def index(conn, _params) do
    compras = Movimentacao.list_compras()
    render(conn, "index.html", compras: compras)
  end

  def new(conn, _params) do
    changeset = Movimentacao.change_compra(%Compra{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"compra" => compra_params}) do
    case Movimentacao.create_compra(compra_params) do
      {:ok, compra} ->
        conn
        |> put_flash(:info, "Compra created successfully.")
        |> redirect(to: Routes.compra_path(conn, :show, compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    compra = Movimentacao.get_compra!(id)
    render(conn, "show.html", compra: compra)
  end

  def edit(conn, %{"id" => id}) do
    compra = Movimentacao.get_compra!(id)
    changeset = Movimentacao.change_compra(compra)
    render(conn, "edit.html", compra: compra, changeset: changeset)
  end

  def update(conn, %{"id" => id, "compra" => compra_params}) do
    compra = Movimentacao.get_compra!(id)

    case Movimentacao.update_compra(compra, compra_params) do
      {:ok, compra} ->
        conn
        |> put_flash(:info, "Compra updated successfully.")
        |> redirect(to: Routes.compra_path(conn, :show, compra))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", compra: compra, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    compra = Movimentacao.get_compra!(id)
    {:ok, _compra} = Movimentacao.delete_compra(compra)

    conn
    |> put_flash(:info, "Compra deleted successfully.")
    |> redirect(to: Routes.compra_path(conn, :index))
  end
end
