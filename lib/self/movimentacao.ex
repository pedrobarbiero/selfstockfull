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

  alias Self.Movimentacao.Venda

  @doc """
  Returns the list of vendas.

  ## Examples

      iex> list_vendas()
      [%Venda{}, ...]

  """
  def list_vendas do
    Repo.all(Venda)
  end

  @doc """
  Gets a single venda.

  Raises `Ecto.NoResultsError` if the Venda does not exist.

  ## Examples

      iex> get_venda!(123)
      %Venda{}

      iex> get_venda!(456)
      ** (Ecto.NoResultsError)

  """
  def get_venda!(id), do: Repo.get!(Venda, id)

  @doc """
  Creates a venda.

  ## Examples

      iex> create_venda(%{field: value})
      {:ok, %Venda{}}

      iex> create_venda(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_venda(attrs \\ %{}) do
    %Venda{}
    |> Venda.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a venda.

  ## Examples

      iex> update_venda(venda, %{field: new_value})
      {:ok, %Venda{}}

      iex> update_venda(venda, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_venda(%Venda{} = venda, attrs) do
    venda
    |> Venda.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Venda.

  ## Examples

      iex> delete_venda(venda)
      {:ok, %Venda{}}

      iex> delete_venda(venda)
      {:error, %Ecto.Changeset{}}

  """
  def delete_venda(%Venda{} = venda) do
    Repo.delete(venda)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking venda changes.

  ## Examples

      iex> change_venda(venda)
      %Ecto.Changeset{source: %Venda{}}

  """
  def change_venda(%Venda{} = venda) do
    Venda.changeset(venda, %{})
  end

  alias Self.Movimentacao.ItemVenda

  @doc """
  Returns the list of itens_venda.

  ## Examples

      iex> list_itens_venda()
      [%ItemVenda{}, ...]

  """
  def list_itens_venda do
    Repo.all(ItemVenda)
  end

  @doc """
  Gets a single item_venda.

  Raises `Ecto.NoResultsError` if the Item venda does not exist.

  ## Examples

      iex> get_item_venda!(123)
      %ItemVenda{}

      iex> get_item_venda!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item_venda!(id), do: Repo.get!(ItemVenda, id)

  @doc """
  Creates a item_venda.

  ## Examples

      iex> create_item_venda(%{field: value})
      {:ok, %ItemVenda{}}

      iex> create_item_venda(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item_venda(attrs \\ %{}) do
    %ItemVenda{}
    |> ItemVenda.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item_venda.

  ## Examples

      iex> update_item_venda(item_venda, %{field: new_value})
      {:ok, %ItemVenda{}}

      iex> update_item_venda(item_venda, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item_venda(%ItemVenda{} = item_venda, attrs) do
    item_venda
    |> ItemVenda.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ItemVenda.

  ## Examples

      iex> delete_item_venda(item_venda)
      {:ok, %ItemVenda{}}

      iex> delete_item_venda(item_venda)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item_venda(%ItemVenda{} = item_venda) do
    Repo.delete(item_venda)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item_venda changes.

  ## Examples

      iex> change_item_venda(item_venda)
      %Ecto.Changeset{source: %ItemVenda{}}

  """
  def change_item_venda(%ItemVenda{} = item_venda) do
    ItemVenda.changeset(item_venda, %{})
  end

  def itens_by_compraid(compra_id) do
    qry = from(ic in ItemCompra, where: ic.compra_id == ^compra_id)
    Repo.all(qry)
  end

  def itens_by_vendaid(venda_id) do
    qry = from(iv in ItemVenda, where: iv.venda_id == ^venda_id)
    Repo.all(qry)
  end

  def select_compras do
    Repo.all(Compra)
    |> Enum.map(&{"#{&1.numero}", &1.id})
  end

  def select_vendas do
    Repo.all(Venda)
    |> Enum.map(&{"#{&1.id}", &1.id})
  end

end
