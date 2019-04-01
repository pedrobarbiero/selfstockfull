defmodule SelfWeb.Router do
  use SelfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SelfWeb.Plug.SetUser
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
    resources "/produtos", ProdutoController
    resources "/compras", CompraController
    resources "/itens_compra", ItemCompraController
    resources "/vendas", VendaController
    resources "/itens_venda", ItemVendaController
    resources "/usuarios", UsuarioController
    get "/itens_venda/:id/venda", ItemVendaController, :venda
    get "/itens_compra/:id/compra", ItemCompraController, :compra
  end

  scope "/auth", SelfWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    get "/:provider/logout", AuthController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", SelfWeb do
  #   pipe_through :api
  # end
end
