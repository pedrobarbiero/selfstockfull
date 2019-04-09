defmodule SelfWeb.Plug.SetUser do
  use Phoenix.Controller
  import Plug.Conn

  alias Self.Repo
  alias Self.Ator.{Usuario}

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    if user_id do
      user = user_id && Repo.get(Usuario, user_id)
      assign(conn, :user, user)

      if user.funcionario_id do
        assign(conn, :user, user)
      else
        assign(conn, :user, nil)
      end
    else
      assign(conn, :user, nil)
    end
  end
end
