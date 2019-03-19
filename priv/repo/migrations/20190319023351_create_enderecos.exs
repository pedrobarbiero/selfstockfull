defmodule Self.Repo.Migrations.CreateEnderecos do
  use Ecto.Migration

  def change do
    create table(:enderecos) do
      add :logradouro, :string
      add :numero, :string
      add :cep, :string
      add :bairro, :string
      add :cidade_id, references(:cidades, on_delete: :nothing)

      timestamps()
    end

    create index(:enderecos, [:cidade_id])
  end
end
