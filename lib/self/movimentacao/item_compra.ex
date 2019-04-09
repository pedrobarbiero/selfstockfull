defmodule Self.Movimentacao.ItemCompra do
  use Ecto.Schema
  import Ecto.Changeset

  schema "itens_compra" do
    field :quantidade, :integer
    field :valor_unitario, :decimal
    belongs_to(:produtos, Self.Estoque.Produto, [foreign_key: :produto_id])
    belongs_to(:compras, Self.Movimentacao.Compra, [foreign_key: :compra_id])

    timestamps()
  end

  @doc false
  def changeset(item_compra, attrs) do
    item_compra
    |> cast(attrs, [:quantidade, :valor_unitario, :produto_id, :compra_id])
    |> validate_required([:quantidade, :valor_unitario, :produto_id, :compra_id])
  end
end
