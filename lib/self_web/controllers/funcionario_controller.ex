defmodule SelfWeb.FuncionarioController do
  use SelfWeb, :controller

  alias Self.Ator
  alias Self.Ator.Funcionario
  alias Self.Localizacao

  plug SelfWeb.Plug.RequireAuth when action in [:index, :edit, :new, :show, :create, :update, :delete]

  def index(conn, _params) do
    funcionarios = Ator.list_funcionarios()
    render(conn, "index.html", funcionarios: funcionarios)
  end

  def new(conn, _params) do
    changeset = Ator.change_funcionario(%Funcionario{})
    enderecos = Localizacao.select_enderecos()
    sexos = Ator.select_sexo
    render(conn, "new.html", changeset: changeset, enderecos: enderecos, sexos: sexos)
  end

  def create(conn, %{"funcionario" => funcionario_params}) do
    case Ator.create_funcionario(funcionario_params) do
      {:ok, funcionario} ->
        conn
        |> put_flash(:info, "Funcionario criado com sucesso.")
        |> redirect(to: Routes.funcionario_path(conn, :show, funcionario))

      {:error, %Ecto.Changeset{} = changeset} ->
        enderecos = Localizacao.select_enderecos()
        sexos = Ator.select_sexo
        render(conn, "new.html", changeset: changeset, enderecos: enderecos, sexos: sexos)
    end
  end

  def show(conn, %{"id" => id}) do
    funcionario = Ator.get_funcionario!(id)
    render(conn, "show.html", funcionario: funcionario)
  end

  def edit(conn, %{"id" => id}) do
    funcionario = Ator.get_funcionario!(id)
    changeset = Ator.change_funcionario(funcionario)
    enderecos = Localizacao.select_enderecos()
    sexos = Ator.select_sexo
    render(conn, "edit.html", funcionario: funcionario, changeset: changeset, enderecos: enderecos, sexos: sexos)
  end

  def update(conn, %{"id" => id, "funcionario" => funcionario_params}) do
    funcionario = Ator.get_funcionario!(id)

    case Ator.update_funcionario(funcionario, funcionario_params) do
      {:ok, funcionario} ->
        conn
        |> put_flash(:info, "Funcionario atualizado com sucesso.")
        |> redirect(to: Routes.funcionario_path(conn, :show, funcionario))

      {:error, %Ecto.Changeset{} = changeset} ->
        enderecos = Localizacao.select_enderecos()
        sexos = Ator.select_sexo
        render(conn, "edit.html", funcionario: funcionario, changeset: changeset, enderecos: enderecos, sexos: sexos)
    end
  end

  def delete(conn, %{"id" => id}) do
    funcionario = Ator.get_funcionario!(id)
    {:ok, _funcionario} = Ator.delete_funcionario(funcionario)

    conn
    |> put_flash(:info, "Funcionario excluido com sucesso.")
    |> redirect(to: Routes.funcionario_path(conn, :index))
  end
end
