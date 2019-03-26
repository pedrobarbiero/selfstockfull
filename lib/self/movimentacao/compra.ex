defmodule Self.Movimentacao.Compra do
  use Ecto.Schema
  import Ecto.Changeset

  schema "compras" do
    field :data, :date
    field :desconto, :decimal
    field :icms, :string
    field :numero, :string
    field :vencimento, :date
    belongs_to(:funcionarios, Self.Ator.Funcionario, [foreign_key: :funcionario_id])
    belongs_to(:fornecedores, Self.Ator.Fornecedor, [foreign_key: :fornecedor_id])

    timestamps()
  end

  @doc false
  def changeset(compra, attrs) do
    compra
    |> cast(attrs, [:numero, :data, :icms, :desconto, :vencimento, :funcionario_id, :fornecedor_id])
    |> validate_required([:numero, :data, :icms, :desconto, :vencimento, :funcionario_id, :fornecedor_id])
  end
end
