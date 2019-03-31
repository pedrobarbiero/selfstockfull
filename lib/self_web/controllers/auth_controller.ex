defmodule SelfWeb.AuthController do
  use SelfWeb, :controller
  plug Ueberauth

  def callback(_conn, params) do
    IO.puts "INICIO----------------------------------------"
    IO.inspect params
    IO.puts "FIM----------------------------------------"
  end
end
