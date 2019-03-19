defmodule SelfWeb.EnderecoController do
  use SelfWeb, :controller

  alias Self.Localizacao
  alias Self.Localizacao.Endereco

  def index(conn, _params) do
    enderecos = Localizacao.list_enderecos()
    render(conn, "index.html", enderecos: enderecos)
  end

  def new(conn, _params) do
    changeset = Localizacao.change_endereco(%Endereco{})
    cidades = Localizacao.select_cidades()
    render(conn, "new.html", changeset: changeset, cidades: cidades)
  end

  def create(conn, %{"endereco" => endereco_params}) do
    case Localizacao.create_endereco(endereco_params) do
      {:ok, endereco} ->
        conn
        |> put_flash(:info, "Endereco created successfully.")
        |> redirect(to: Routes.endereco_path(conn, :show, endereco))

      {:error, %Ecto.Changeset{} = changeset} ->
        cidades = Localizacao.select_cidades()
        render(conn, "new.html", changeset: changeset, cidades: cidades)
    end
  end

  def show(conn, %{"id" => id}) do
    endereco = Localizacao.get_endereco!(id)
    render(conn, "show.html", endereco: endereco)
  end

  def edit(conn, %{"id" => id}) do
    endereco = Localizacao.get_endereco!(id)
    changeset = Localizacao.change_endereco(endereco)
    cidades = Localizacao.select_cidades()
    render(conn, "edit.html", endereco: endereco, changeset: changeset, cidades: cidades)
  end

  def update(conn, %{"id" => id, "endereco" => endereco_params}) do
    endereco = Localizacao.get_endereco!(id)

    case Localizacao.update_endereco(endereco, endereco_params) do
      {:ok, endereco} ->
        conn
        |> put_flash(:info, "Endereco updated successfully.")
        |> redirect(to: Routes.endereco_path(conn, :show, endereco))

      {:error, %Ecto.Changeset{} = changeset} ->
        cidades = Localizacao.select_cidades()
        render(conn, "edit.html", endereco: endereco, changeset: changeset, cidades: cidades)
    end
  end

  def delete(conn, %{"id" => id}) do
    endereco = Localizacao.get_endereco!(id)
    {:ok, _endereco} = Localizacao.delete_endereco(endereco)

    conn
    |> put_flash(:info, "Endereco deleted successfully.")
    |> redirect(to: Routes.endereco_path(conn, :index))
  end
end
