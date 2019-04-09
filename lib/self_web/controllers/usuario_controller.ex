defmodule SelfWeb.UsuarioController do
  use SelfWeb, :controller

  alias Self.Ator
  alias Self.Ator.Usuario

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    usuarios = Ator.list_usuarios()
    render(conn, "index.html", usuarios: usuarios)
  end

  def new(conn, _params) do
    changeset = Ator.change_usuario(%Usuario{})
    funcionarios = Ator.select_funcionarios()
    render(conn, "new.html", changeset: changeset, funcionarios: funcionarios)
  end

  def create(conn, %{"usuario" => usuario_params}) do
    case Ator.create_usuario(usuario_params) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Usuario criado com sucesso.")
        |> redirect(to: Routes.usuario_path(conn, :show, usuario))

      {:error, %Ecto.Changeset{} = changeset} ->
        funcionarios = Ator.select_funcionarios()
        render(conn, "new.html", changeset: changeset, funcionarios: funcionarios)
    end
  end

  def show(conn, %{"id" => id}) do
    usuario = Ator.get_usuario!(id)
    render(conn, "show.html", usuario: usuario)
  end

  def edit(conn, %{"id" => id}) do
    usuario = Ator.get_usuario!(id)
    changeset = Ator.change_usuario(usuario)
    funcionarios = Ator.select_funcionarios()
    render(conn, "edit.html", usuario: usuario, changeset: changeset, funcionarios: funcionarios)
  end

  def update(conn, %{"id" => id, "usuario" => usuario_params}) do
    usuario = Ator.get_usuario!(id)

    case Ator.update_usuario(usuario, usuario_params) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Usuario atualizado com sucesso.")
        |> redirect(to: Routes.usuario_path(conn, :show, usuario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", usuario: usuario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    usuario = Ator.get_usuario!(id)
    {:ok, _usuario} = Ator.delete_usuario(usuario)

    conn
    |> put_flash(:info, "Usuario excluido com sucesso.")
    |> redirect(to: Routes.usuario_path(conn, :index))
  end
end
