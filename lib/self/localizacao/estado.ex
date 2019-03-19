defmodule Self.Localizacao.Estado do
  use Ecto.Schema
  import Ecto.Changeset

  schema "estados" do
    field :nome, :string
    field :uf, :string
    belongs_to(:paises, Self.Localizacao.Pais, [foreign_key: :pais_id])

    timestamps()
  end

  @doc false
  def changeset(estado, attrs) do
    estado
    |> cast(attrs, [:nome, :uf, :pais_id])
    |> validate_required([:nome, :uf, :pais_id])
  end
end
