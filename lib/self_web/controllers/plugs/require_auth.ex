defmodule SelfWeb.Plug.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  # alias SelfWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    user = conn.assigns[:user]
    IO.puts "ASSIGNS USER"
    IO.inspect user
    IO.puts "ASSIGNS fim USER"
    if (conn.assigns[:user]) do
      conn
    else
      conn
      |> Phoenix.Controller.put_flash(:error, "Sem permissão")
      |> redirect(to: "/")
      |> halt()
    end
  end
end
