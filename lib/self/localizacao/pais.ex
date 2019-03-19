defmodule Self.Localizacao.Pais do
  use Ecto.Schema
  import Ecto.Changeset

  schema "paises" do
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(pais, attrs) do
    pais
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end
