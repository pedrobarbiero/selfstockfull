defmodule Self.Estoque.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :descricao, :string
    field :nome, :string
    field :tipo, :integer
    field :valor_compra, :decimal
    field :valor_venda, :decimal

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome, :descricao, :valor_compra, :valor_venda, :tipo])
    |> validate_required([:nome, :descricao, :valor_compra, :valor_venda, :tipo])
  end
end
