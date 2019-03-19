defmodule SelfWeb.EstadoController do
  use SelfWeb, :controller

  alias Self.Localizacao
  alias Self.Localizacao.Estado

  def index(conn, _params) do
    estados = Localizacao.list_estados()
    render(conn, "index.html", estados: estados)
  end

  def new(conn, _params) do
    changeset = Localizacao.change_estado(%Estado{})
    paises = Localizacao.select_paises
    render(conn, "new.html", changeset: changeset, paises: paises)
  end

  def create(conn, %{"estado" => estado_params}) do
    case Localizacao.create_estado(estado_params) do
      {:ok, estado} ->
        conn
        |> put_flash(:info, "Estado created successfully.")
        |> redirect(to: Routes.estado_path(conn, :show, estado))

      {:error, %Ecto.Changeset{} = changeset} ->
        paises = Localizacao.select_paises
        render(conn, "new.html", changeset: changeset, paises: paises)
    end
  end

  def show(conn, %{"id" => id}) do
    estado = Localizacao.get_estado!(id)
    render(conn, "show.html", estado: estado)
  end

  def edit(conn, %{"id" => id}) do
    estado = Localizacao.get_estado!(id)
    changeset = Localizacao.change_estado(estado)
    paises = Localizacao.select_paises
    render(conn, "edit.html", estado: estado, changeset: changeset, paises: paises)
  end

  def update(conn, %{"id" => id, "estado" => estado_params}) do
    estado = Localizacao.get_estado!(id)

    case Localizacao.update_estado(estado, estado_params) do
      {:ok, estado} ->
        conn
        |> put_flash(:info, "Estado updated successfully.")
        |> redirect(to: Routes.estado_path(conn, :show, estado))

      {:error, %Ecto.Changeset{} = changeset} ->
        paises = Localizacao.select_paises
        render(conn, "edit.html", estado: estado, changeset: changeset, paises: paises)
    end
  end

  def delete(conn, %{"id" => id}) do
    estado = Localizacao.get_estado!(id)
    {:ok, _estado} = Localizacao.delete_estado(estado)

    conn
    |> put_flash(:info, "Estado deleted successfully.")
    |> redirect(to: Routes.estado_path(conn, :index))
  end
end
