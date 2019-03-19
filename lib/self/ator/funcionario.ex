defmodule Self.Ator.Funcionario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "funcionarios" do
    field :cpf, :string
    field :data_nascimento, :date
    field :email, :string
    field :nome, :string
    field :sexo, :integer
    field :telefone, :string
    field :endereco_id, :id

    timestamps()
  end

  @doc false
  def changeset(funcionario, attrs) do
    funcionario
    |> cast(attrs, [:nome, :data_nascimento, :email, :cpf, :sexo, :telefone])
    |> validate_required([:nome, :data_nascimento, :email, :cpf, :sexo, :telefone])
  end
end
