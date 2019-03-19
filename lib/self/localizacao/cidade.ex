defmodule Self.Localizacao.Cidade do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cidades" do
    field :nome, :string
    belongs_to(:estados, Self.Localizacao.Estado, [foreign_key: :estado_id])

    timestamps()
  end

  @doc false
  def changeset(cidade, attrs) do
    cidade
    |> cast(attrs, [:nome, :estado_id])
    |> validate_required([:nome, :estado_id])
  end
end
