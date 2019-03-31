defmodule Self.Ator.Usuario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuarios" do
    field :email, :string
    field :nome, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    IO.puts "entro 3"
    usuario
    |> cast(attrs, [:nome, :provider, :email, :token])
    |> validate_required([:nome, :provider, :email, :token])
  end
end
