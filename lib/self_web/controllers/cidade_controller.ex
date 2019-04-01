defmodule SelfWeb.CidadeController do
  use SelfWeb, :controller

  alias Self.Localizacao
  alias Self.Localizacao.Cidade

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    cidades = Localizacao.list_cidades()
    render(conn, "index.html", cidades: cidades)
  end

  def new(conn, _params) do
    changeset = Localizacao.change_cidade(%Cidade{})
    estados = Localizacao.select_estados()
    render(conn, "new.html", changeset: changeset, estados: estados)
  end

  def create(conn, %{"cidade" => cidade_params}) do
    case Localizacao.create_cidade(cidade_params) do
      {:ok, cidade} ->
        conn
        |> put_flash(:info, "Cidade created successfully.")
        |> redirect(to: Routes.cidade_path(conn, :show, cidade))

      {:error, %Ecto.Changeset{} = changeset} ->
        estados = Localizacao.select_estados()
        render(conn, "new.html", changeset: changeset, estados: estados)
    end
  end

  def show(conn, %{"id" => id}) do
    cidade = Localizacao.get_cidade!(id)
    render(conn, "show.html", cidade: cidade)
  end

  def edit(conn, %{"id" => id}) do
    cidade = Localizacao.get_cidade!(id)
    changeset = Localizacao.change_cidade(cidade)
    estados = Localizacao.select_estados()
    render(conn, "edit.html", cidade: cidade, changeset: changeset, estados: estados)
  end

  def update(conn, %{"id" => id, "cidade" => cidade_params}) do
    cidade = Localizacao.get_cidade!(id)

    case Localizacao.update_cidade(cidade, cidade_params) do
      {:ok, cidade} ->
        conn
        |> put_flash(:info, "Cidade updated successfully.")
        |> redirect(to: Routes.cidade_path(conn, :show, cidade))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cidade: cidade, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cidade = Localizacao.get_cidade!(id)
    {:ok, _cidade} = Localizacao.delete_cidade(cidade)

    conn
    |> put_flash(:info, "Cidade deleted successfully.")
    |> redirect(to: Routes.cidade_path(conn, :index))
  end
end
