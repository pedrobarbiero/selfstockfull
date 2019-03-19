defmodule Self.Localizacao.Endereco do
  use Ecto.Schema
  import Ecto.Changeset

  schema "enderecos" do
    field :bairro, :string
    field :cep, :string
    field :logradouro, :string
    field :numero, :string
    belongs_to(:cidades, Self.Localizacao.Cidade, [foreign_key: :cidade_id])

    timestamps()
  end

  @doc false
  def changeset(endereco, attrs) do
    endereco
    |> cast(attrs, [:logradouro, :numero, :cep, :bairro, :cidade_id])
    |> validate_required([:logradouro, :numero, :cep, :bairro, :cidade_id])
  end
end
