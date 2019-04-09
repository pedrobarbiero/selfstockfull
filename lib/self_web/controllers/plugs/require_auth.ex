defmodule SelfWeb.Plug.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do
  end

  def call(conn, _params) do
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
