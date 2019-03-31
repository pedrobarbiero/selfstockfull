defmodule SelfWeb.AuthController do
  use SelfWeb, :controller
  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider}) do
    IO.puts "inicio CALLBACK ---------"
    IO.inspect auth
    IO.puts "FIM CALL BACK ---"
    usuario = %{
      nome: auth.info.name,
      email: auth.info.email,
      provider: provider,
      token: auth.credentials.token
    }

    IO.inspect usuario
    IO.puts "FIM USUARIO-----------"

    case Self.Ator.change_create_usuario(usuario) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Bem vindo #{usuario.nome}")
        |> put_session(:user_id, usuario.id)
        |> redirect(to: Routes.produto_path(conn, :index))

      {:error, msg} ->
        conn
        |> put_flash(:error, msg)
        |> redirect(to: Routes.produto_path(conn, :index))
    end
  end

  def logout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.produto_path(conn, :index))
  end
end
