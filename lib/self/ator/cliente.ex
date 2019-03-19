defmodule Self.Ator.Cliente do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clientes" do
    field :cpf, :string
    field :data_nascimento, :date
    field :email, :string
    field :nome, :string
    field :sexo, :integer
    field :telefone, :string
    belongs_to(:enderecos, Self.Localizacao.Endereco, [foreign_key: :endereco_id])

    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:nome, :data_nascimento, :email, :cpf, :sexo, :telefone, :endereco_id])
    |> validate_required([:nome, :data_nascimento, :email, :cpf, :sexo, :telefone, :endereco_id])
  end
end
