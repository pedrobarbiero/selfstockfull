defmodule Self.Movimentacao do
  @moduledoc """
  The Movimentacao context.
  """

  import Ecto.Query, warn: false
  alias Self.Repo

  alias Self.Movimentacao.Compra

  @doc """
  Returns the list of compras.

  ## Examples

      iex> list_compras()
      [%Compra{}, ...]

  """
  def list_compras do
    Repo.all(Compra)
  end

  @doc """
  Gets a single compra.

  Raises `Ecto.NoResultsError` if the Compra does not exist.

  ## Examples

      iex> get_compra!(123)
      %Compra{}

      iex> get_compra!(456)
      ** (Ecto.NoResultsError)

  """
  def get_compra!(id), do: Repo.get!(Compra, id)

  @doc """
  Creates a compra.

  ## Examples

      iex> create_compra(%{field: value})
      {:ok, %Compra{}}

      iex> create_compra(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_compra(attrs \\ %{}) do
    %Compra{}
    |> Compra.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a compra.

  ## Examples

      iex> update_compra(compra, %{field: new_value})
      {:ok, %Compra{}}

      iex> update_compra(compra, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_compra(%Compra{} = compra, attrs) do
    compra
    |> Compra.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Compra.

  ## Examples

      iex> delete_compra(compra)
      {:ok, %Compra{}}

      iex> delete_compra(compra)
      {:error, %Ecto.Changeset{}}

  """
  def delete_compra(%Compra{} = compra) do
    Repo.delete(compra)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking compra changes.

  ## Examples

      iex> change_compra(compra)
      %Ecto.Changeset{source: %Compra{}}

  """
  def change_compra(%Compra{} = compra) do
    Compra.changeset(compra, %{})
  end

  alias Self.Movimentacao.ItemCompra

  @doc """
  Returns the list of itens_compra.

  ## Examples

      iex> list_itens_compra()
      [%ItemCompra{}, ...]

  """
  def list_itens_compra do
    Repo.all(ItemCompra)
  end

  @doc """
  Gets a single item_compra.

  Raises `Ecto.NoResultsError` if the Item compra does not exist.

  ## Examples

      iex> get_item_compra!(123)
      %ItemCompra{}

      iex> get_item_compra!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item_compra!(id), do: Repo.get!(ItemCompra, id)

  @doc """
  Creates a item_compra.

  ## Examples

      iex> create_item_compra(%{field: value})
      {:ok, %ItemCompra{}}

      iex> create_item_compra(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item_compra(attrs \\ %{}) do
    %ItemCompra{}
    |> ItemCompra.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item_compra.

  ## Examples

      iex> update_item_compra(item_compra, %{field: new_value})
      {:ok, %ItemCompra{}}

      iex> update_item_compra(item_compra, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item_compra(%ItemCompra{} = item_compra, attrs) do
    item_compra
    |> ItemCompra.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ItemCompra.

  ## Examples

      iex> delete_item_compra(item_compra)
      {:ok, %ItemCompra{}}

      iex> delete_item_compra(item_compra)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item_compra(%ItemCompra{} = item_compra) do
    Repo.delete(item_compra)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item_compra changes.

  ## Examples

      iex> change_item_compra(item_compra)
      %Ecto.Changeset{source: %ItemCompra{}}

  """
  def change_item_compra(%ItemCompra{} = item_compra) do
    ItemCompra.changeset(item_compra, %{})
  end
end
