defmodule SelfWeb.Router do
  use SelfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SelfWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/paises", PaisController
    resources "/estados", EstadoController
    resources "/cidades", CidadeController
    resources "/enderecos", EnderecoController
    resources "/clientes", ClienteController
    resources "/fornecedores", FornecedorController
    resources "/funcionarios", FuncionarioController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SelfWeb do
  #   pipe_through :api
  # end
end
