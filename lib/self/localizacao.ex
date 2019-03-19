defmodule Self.Localizacao do
  @moduledoc """
  The Localizacao context.
  """

  import Ecto.Query, warn: false
  alias Self.Repo

  alias Self.Localizacao.Pais

  @doc """
  Returns the list of paises.

  ## Examples

      iex> list_paises()
      [%Pais{}, ...]

  """
  def list_paises do
    Repo.all(Pais)
  end

  @doc """
  Gets a single pais.

  Raises `Ecto.NoResultsError` if the Pais does not exist.

  ## Examples

      iex> get_pais!(123)
      %Pais{}

      iex> get_pais!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pais!(id), do: Repo.get!(Pais, id)

  @doc """
  Creates a pais.

  ## Examples

      iex> create_pais(%{field: value})
      {:ok, %Pais{}}

      iex> create_pais(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pais(attrs \\ %{}) do
    %Pais{}
    |> Pais.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pais.

  ## Examples

      iex> update_pais(pais, %{field: new_value})
      {:ok, %Pais{}}

      iex> update_pais(pais, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pais(%Pais{} = pais, attrs) do
    pais
    |> Pais.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pais.

  ## Examples

      iex> delete_pais(pais)
      {:ok, %Pais{}}

      iex> delete_pais(pais)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pais(%Pais{} = pais) do
    Repo.delete(pais)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pais changes.

  ## Examples

      iex> change_pais(pais)
      %Ecto.Changeset{source: %Pais{}}

  """
  def change_pais(%Pais{} = pais) do
    Pais.changeset(pais, %{})
  end

  alias Self.Localizacao.Estado

  @doc """
  Returns the list of estados.

  ## Examples

      iex> list_estados()
      [%Estado{}, ...]

  """
  def list_estados do
    Repo.all(Estado)
  end

  @doc """
  Gets a single estado.

  Raises `Ecto.NoResultsError` if the Estado does not exist.

  ## Examples

      iex> get_estado!(123)
      %Estado{}

      iex> get_estado!(456)
      ** (Ecto.NoResultsError)

  """
  def get_estado!(id), do: Repo.get!(Estado, id)

  @doc """
  Creates a estado.

  ## Examples

      iex> create_estado(%{field: value})
      {:ok, %Estado{}}

      iex> create_estado(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_estado(attrs \\ %{}) do
    %Estado{}
    |> Estado.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a estado.

  ## Examples

      iex> update_estado(estado, %{field: new_value})
      {:ok, %Estado{}}

      iex> update_estado(estado, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_estado(%Estado{} = estado, attrs) do
    estado
    |> Estado.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Estado.

  ## Examples

      iex> delete_estado(estado)
      {:ok, %Estado{}}

      iex> delete_estado(estado)
      {:error, %Ecto.Changeset{}}

  """
  def delete_estado(%Estado{} = estado) do
    Repo.delete(estado)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking estado changes.

  ## Examples

      iex> change_estado(estado)
      %Ecto.Changeset{source: %Estado{}}

  """
  def change_estado(%Estado{} = estado) do
    Estado.changeset(estado, %{})
  end

  alias Self.Localizacao.Cidade

  @doc """
  Returns the list of cidades.

  ## Examples

      iex> list_cidades()
      [%Cidade{}, ...]

  """
  def list_cidades do
    Repo.all(Cidade)
  end

  @doc """
  Gets a single cidade.

  Raises `Ecto.NoResultsError` if the Cidade does not exist.

  ## Examples

      iex> get_cidade!(123)
      %Cidade{}

      iex> get_cidade!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cidade!(id), do: Repo.get!(Cidade, id)

  @doc """
  Creates a cidade.

  ## Examples

      iex> create_cidade(%{field: value})
      {:ok, %Cidade{}}

      iex> create_cidade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cidade(attrs \\ %{}) do
    %Cidade{}
    |> Cidade.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cidade.

  ## Examples

      iex> update_cidade(cidade, %{field: new_value})
      {:ok, %Cidade{}}

      iex> update_cidade(cidade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cidade(%Cidade{} = cidade, attrs) do
    cidade
    |> Cidade.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cidade.

  ## Examples

      iex> delete_cidade(cidade)
      {:ok, %Cidade{}}

      iex> delete_cidade(cidade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cidade(%Cidade{} = cidade) do
    Repo.delete(cidade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cidade changes.

  ## Examples

      iex> change_cidade(cidade)
      %Ecto.Changeset{source: %Cidade{}}

  """
  def change_cidade(%Cidade{} = cidade) do
    Cidade.changeset(cidade, %{})
  end

  def select_paises do
    Repo.all(Pais)
    |> Enum.map(&{"#{&1.nome}", &1.id})
  end

  def select_estados do
    Repo.all(Estado)
    |> Enum.map(&{"#{&1.nome}", &1.id})
  end

  def select_cidades do
    Repo.all(Cidade)
    |> Enum.map(&{"#{&1.nome}", &1.id})
  end

  alias Self.Localizacao.Endereco

  def select_enderecos do
    Repo.all(Endereco)
    |> Enum.map(&{"#{&1.logradouro} - #{&1.bairro} - #{&1.numero} - CEP: #{&1.cep} ", &1.id})
  end


  @doc """
  Returns the list of enderecos.

  ## Examples

      iex> list_enderecos()
      [%Endereco{}, ...]

  """
  def list_enderecos do
    Repo.all(Endereco)
  end

  @doc """
  Gets a single endereco.

  Raises `Ecto.NoResultsError` if the Endereco does not exist.

  ## Examples

      iex> get_endereco!(123)
      %Endereco{}

      iex> get_endereco!(456)
      ** (Ecto.NoResultsError)

  """
  def get_endereco!(id), do: Repo.get!(Endereco, id)

  @doc """
  Creates a endereco.

  ## Examples

      iex> create_endereco(%{field: value})
      {:ok, %Endereco{}}

      iex> create_endereco(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_endereco(attrs \\ %{}) do
    %Endereco{}
    |> Endereco.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a endereco.

  ## Examples

      iex> update_endereco(endereco, %{field: new_value})
      {:ok, %Endereco{}}

      iex> update_endereco(endereco, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_endereco(%Endereco{} = endereco, attrs) do
    endereco
    |> Endereco.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Endereco.

  ## Examples

      iex> delete_endereco(endereco)
      {:ok, %Endereco{}}

      iex> delete_endereco(endereco)
      {:error, %Ecto.Changeset{}}

  """
  def delete_endereco(%Endereco{} = endereco) do
    Repo.delete(endereco)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking endereco changes.

  ## Examples

      iex> change_endereco(endereco)
      %Ecto.Changeset{source: %Endereco{}}

  """
  def change_endereco(%Endereco{} = endereco) do
    Endereco.changeset(endereco, %{})
  end
end
