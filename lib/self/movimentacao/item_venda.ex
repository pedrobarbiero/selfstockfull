defmodule Self.Movimentacao.ItemVenda do
  use Ecto.Schema
  import Ecto.Changeset

  schema "itens_venda" do
    field :quantidade, :integer
    belongs_to(:vendas, Self.Movimentacao.Venda, [foreign_key: :venda_id])
    belongs_to(:produtos, Self.Estoque.Produto, [foreign_key: :produto_id])

    timestamps()
  end

  @doc false
  def changeset(item_venda, attrs) do
    item_venda
    |> cast(attrs, [:quantidade, :venda_id, :produto_id])
    |> validate_required([:quantidade, :venda_id, :produto_id])
  end
end
