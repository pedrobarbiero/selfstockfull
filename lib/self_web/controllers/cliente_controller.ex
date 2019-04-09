defmodule SelfWeb.ClienteController do
  use SelfWeb, :controller

  alias Self.Ator
  alias Self.Localizacao
  alias Self.Ator.Cliente

  plug SelfWeb.Plug.RequireAuth
       when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    clientes = Ator.list_clientes()
    render(conn, "index.html", clientes: clientes)
  end

  def new(conn, _params) do
    changeset = Ator.change_cliente(%Cliente{})
    enderecos = Localizacao.select_enderecos()
    sexos = Ator.select_sexo()
    render(conn, "new.html", changeset: changeset, enderecos: enderecos, sexos: sexos)
  end

  def create(conn, %{"cliente" => cliente_params}) do
    case Ator.create_cliente(cliente_params) do
      {:ok, cliente} ->
        conn
        |> put_flash(:info, "Cliente criado com sucesso.")
        |> redirect(to: Routes.cliente_path(conn, :show, cliente))

      {:error, %Ecto.Changeset{} = changeset} ->
        enderecos = Localizacao.select_enderecos()
        sexos = Ator.select_sexo()
        render(conn, "new.html", changeset: changeset, enderecos: enderecos, sexos: sexos)
    end
  end

  def show(conn, %{"id" => id}) do
    cliente = Ator.get_cliente!(id)
    render(conn, "show.html", cliente: cliente)
  end

  def edit(conn, %{"id" => id}) do
    cliente = Ator.get_cliente!(id)
    changeset = Ator.change_cliente(cliente)
    enderecos = Localizacao.select_enderecos()
    sexos = Ator.select_sexo()

    render(conn, "edit.html",
      cliente: cliente,
      changeset: changeset,
      enderecos: enderecos,
      sexos: sexos
    )
  end

  def update(conn, %{"id" => id, "cliente" => cliente_params}) do
    cliente = Ator.get_cliente!(id)

    case Ator.update_cliente(cliente, cliente_params) do
      {:ok, cliente} ->
        conn
        |> put_flash(:info, "Cliente atualizado com sucesso.")
        |> redirect(to: Routes.cliente_path(conn, :show, cliente))

      {:error, %Ecto.Changeset{} = changeset} ->
        enderecos = Localizacao.select_enderecos()
        sexos = Ator.select_sexo()

        render(conn, "edit.html",
          cliente: cliente,
          changeset: changeset,
          enderecos: enderecos,
          sexos: sexos
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    cliente = Ator.get_cliente!(id)
    {:ok, _cliente} = Ator.delete_cliente(cliente)

    conn
    |> put_flash(:info, "Cliente excluido com sucesso.")
    |> redirect(to: Routes.cliente_path(conn, :index))
  end
end
