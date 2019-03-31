defmodule Self.Ator.Usuario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuarios" do
    field :email, :string
    field :nome, :string
    field :provider, :string
    field :token, :string
    belongs_to(:funcionarios, Self.Ator.Funcionario, [foreign_key: :funcionario_id])

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome, :provider, :email, :token, :funcionario_id])
    |> validate_required([:nome, :provider, :email, :token, :funcionario_id])
  end
end
