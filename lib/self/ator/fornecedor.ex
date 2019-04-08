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
    |> valida_cnpj(:cnpj)
    |> validate_required([:nome_fantasia, :razao_social, :email, :cnpj, :telefone, :inscrica_estadual, :endereco_id])
  end
  def valida_cnpj(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, cnpj ->
      number = %Cnpj{number: cnpj}
      case Brcpfcnpj.cnpj_valid?(number) do
        true -> []
        false -> [{field, options[:message] || "CNPJ inválido"}]
      end
    end)
  end
end
