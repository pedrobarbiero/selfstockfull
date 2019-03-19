defmodule Self.Ator.Fornecedor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fornecedores" do
    field :cnpj, :string
    field :email, :string
    field :inscrica_estadual, :string
    field :nome_fantasia, :string
    field :razao_social, :string
    field :telefone, :string
    belongs_to(:enderecos, Self.Localizacao.Endereco, [foreign_key: :endereco_id])

    timestamps()
  end

  @doc false
  def changeset(fornecedor, attrs) do
    fornecedor
    |> cast(attrs, [:nome_fantasia, :razao_social, :email, :cnpj, :telefone, :inscrica_estadual, :endereco_id])
    |> validate_required([:nome_fantasia, :razao_social, :email, :cnpj, :telefone, :inscrica_estadual, :endereco_id])
  end
end
