defmodule Self.Ator do
  @moduledoc """
  The Ator context.
  """

  import Ecto.Query, warn: false
  alias Self.Repo

  alias Self.Ator.Cliente

  @doc """
  Returns the list of clientes.

  ## Examples

      iex> list_clientes()
      [%Cliente{}, ...]

  """
  def list_clientes do
    Repo.all(Cliente)
  end

  @doc """
  Gets a single cliente.

  Raises `Ecto.NoResultsError` if the Cliente does not exist.

  ## Examples

      iex> get_cliente!(123)
      %Cliente{}

      iex> get_cliente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cliente!(id), do: Repo.get!(Cliente, id)

  @doc """
  Creates a cliente.

  ## Examples

      iex> create_cliente(%{field: value})
      {:ok, %Cliente{}}

      iex> create_cliente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cliente(attrs \\ %{}) do
    %Cliente{}
    |> Cliente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cliente.

  ## Examples

      iex> update_cliente(cliente, %{field: new_value})
      {:ok, %Cliente{}}

      iex> update_cliente(cliente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cliente(%Cliente{} = cliente, attrs) do
    cliente
    |> Cliente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cliente.

  ## Examples

      iex> delete_cliente(cliente)
      {:ok, %Cliente{}}

      iex> delete_cliente(cliente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cliente(%Cliente{} = cliente) do
    Repo.delete(cliente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cliente changes.

  ## Examples

      iex> change_cliente(cliente)
      %Ecto.Changeset{source: %Cliente{}}

  """
  def change_cliente(%Cliente{} = cliente) do
    Cliente.changeset(cliente, %{})
  end

  alias Self.Ator.Fornecedor

  @doc """
  Returns the list of fornecedores.

  ## Examples

      iex> list_fornecedores()
      [%Fornecedor{}, ...]

  """
  def list_fornecedores do
    Repo.all(Fornecedor)
  end

  @doc """
  Gets a single fornecedor.

  Raises `Ecto.NoResultsError` if the Fornecedor does not exist.

  ## Examples

      iex> get_fornecedor!(123)
      %Fornecedor{}

      iex> get_fornecedor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fornecedor!(id), do: Repo.get!(Fornecedor, id)

  @doc """
  Creates a fornecedor.

  ## Examples

      iex> create_fornecedor(%{field: value})
      {:ok, %Fornecedor{}}

      iex> create_fornecedor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fornecedor(attrs \\ %{}) do
    %Fornecedor{}
    |> Fornecedor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fornecedor.

  ## Examples

      iex> update_fornecedor(fornecedor, %{field: new_value})
      {:ok, %Fornecedor{}}

      iex> update_fornecedor(fornecedor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fornecedor(%Fornecedor{} = fornecedor, attrs) do
    fornecedor
    |> Fornecedor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Fornecedor.

  ## Examples

      iex> delete_fornecedor(fornecedor)
      {:ok, %Fornecedor{}}

      iex> delete_fornecedor(fornecedor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fornecedor(%Fornecedor{} = fornecedor) do
    Repo.delete(fornecedor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fornecedor changes.

  ## Examples

      iex> change_fornecedor(fornecedor)
      %Ecto.Changeset{source: %Fornecedor{}}

  """
  def change_fornecedor(%Fornecedor{} = fornecedor) do
    Fornecedor.changeset(fornecedor, %{})
  end

  alias Self.Ator.Funcionario

  @doc """
  Returns the list of funcionarios.

  ## Examples

      iex> list_funcionarios()
      [%Funcionario{}, ...]

  """
  def list_funcionarios do
    Repo.all(Funcionario)
  end

  @doc """
  Gets a single funcionario.

  Raises `Ecto.NoResultsError` if the Funcionario does not exist.

  ## Examples

      iex> get_funcionario!(123)
      %Funcionario{}

      iex> get_funcionario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_funcionario!(id), do: Repo.get!(Funcionario, id)

  @doc """
  Creates a funcionario.

  ## Examples

      iex> create_funcionario(%{field: value})
      {:ok, %Funcionario{}}

      iex> create_funcionario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_funcionario(attrs \\ %{}) do
    %Funcionario{}
    |> Funcionario.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a funcionario.

  ## Examples

      iex> update_funcionario(funcionario, %{field: new_value})
      {:ok, %Funcionario{}}

      iex> update_funcionario(funcionario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_funcionario(%Funcionario{} = funcionario, attrs) do
    funcionario
    |> Funcionario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Funcionario.

  ## Examples

      iex> delete_funcionario(funcionario)
      {:ok, %Funcionario{}}

      iex> delete_funcionario(funcionario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_funcionario(%Funcionario{} = funcionario) do
    Repo.delete(funcionario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking funcionario changes.

  ## Examples

      iex> change_funcionario(funcionario)
      %Ecto.Changeset{source: %Funcionario{}}

  """
  def change_funcionario(%Funcionario{} = funcionario) do
    Funcionario.changeset(funcionario, %{})
  end

  alias Self.Ator.Usuario

  @doc """
  Returns the list of usuarios.

  ## Examples

      iex> list_usuarios()
      [%Usuario{}, ...]

  """
  def list_usuarios do
    Repo.all(Usuario)
  end

  @doc """
  Gets a single usuario.

  Raises `Ecto.NoResultsError` if the Usuario does not exist.

  ## Examples

      iex> get_usuario!(123)
      %Usuario{}

      iex> get_usuario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_usuario!(id), do: Repo.get!(Usuario, id)

  @doc """
  Creates a usuario.

  ## Examples

      iex> create_usuario(%{field: value})
      {:ok, %Usuario{}}

      iex> create_usuario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_usuario(attrs \\ %{}) do
    %Usuario{}
    |> Usuario.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a usuario.

  ## Examples

      iex> update_usuario(usuario, %{field: new_value})
      {:ok, %Usuario{}}

      iex> update_usuario(usuario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_usuario(%Usuario{} = usuario, attrs) do
    usuario
    |> Usuario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Usuario.

  ## Examples

      iex> delete_usuario(usuario)
      {:ok, %Usuario{}}

      iex> delete_usuario(usuario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_usuario(%Usuario{} = usuario) do
    Repo.delete(usuario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking usuario changes.

  ## Examples

      iex> change_usuario(usuario)
      %Ecto.Changeset{source: %Usuario{}}

  """
  def change_usuario(%Usuario{} = usuario) do
    Usuario.changeset(usuario, %{})
  end

  def change_create_usuario(attrs \\ %{}) do
    changeset = Usuario.changeset(%Usuario{}, attrs)
    case Repo.get_by(Usuario, email: changeset.changes.email) do
      nil -> Repo.insert changeset
      usuario -> {:ok, usuario}
    end
  end

  def select_funcionarios do
    Repo.all(Funcionario)
    |> Enum.map(&{"#{&1.nome}", &1.id})
  end
end
