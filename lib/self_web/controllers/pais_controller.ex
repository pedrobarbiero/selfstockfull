defmodule SelfWeb.PaisController do
  use SelfWeb, :controller

  alias Self.Localizacao
  alias Self.Localizacao.Pais

  def index(conn, _params) do
    paises = Localizacao.list_paises()
    render(conn, "index.html", paises: paises)
  end

  def new(conn, _params) do
    changeset = Localizacao.change_pais(%Pais{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pais" => pais_params}) do
    case Localizacao.create_pais(pais_params) do
      {:ok, pais} ->
        conn
        |> put_flash(:info, "Pais created successfully.")
        |> redirect(to: Routes.pais_path(conn, :show, pais))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pais = Localizacao.get_pais!(id)
    render(conn, "show.html", pais: pais)
  end

  def edit(conn, %{"id" => id}) do
    pais = Localizacao.get_pais!(id)
    changeset = Localizacao.change_pais(pais)
    render(conn, "edit.html", pais: pais, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pais" => pais_params}) do
    pais = Localizacao.get_pais!(id)

    case Localizacao.update_pais(pais, pais_params) do
      {:ok, pais} ->
        conn
        |> put_flash(:info, "Pais updated successfully.")
        |> redirect(to: Routes.pais_path(conn, :show, pais))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pais: pais, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pais = Localizacao.get_pais!(id)
    {:ok, _pais} = Localizacao.delete_pais(pais)

    conn
    |> put_flash(:info, "Pais deleted successfully.")
    |> redirect(to: Routes.pais_path(conn, :index))
  end
end
