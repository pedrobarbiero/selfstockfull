defmodule Self.Movimentacao.Venda do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendas" do
    field :data, :date
    field :desconto, :decimal
    field :valor, :decimal
    field :funcionario_id, :id
    field :cliente_id, :id

    timestamps()
  end

  @doc false
  def changeset(venda, attrs) do
    venda
    |> cast(attrs, [:valor, :data, :desconto])
    |> validate_required([:valor, :data, :desconto])
  end
end
