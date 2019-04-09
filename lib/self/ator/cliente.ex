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
    |> valida_cpf(:cpf)
    |> validate_required([:nome, :data_nascimento, :email, :cpf, :sexo, :telefone, :endereco_id])
  end

  def valida_cpf(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, cpf ->
      number = %Cpf{number: cpf}
      case Brcpfcnpj.cpf_valid?(number) do
        true -> []
        false -> [{field, options[:message] || "cpf inválido"}]
      end
    end)
  end

end
