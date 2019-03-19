defmodule Self.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes) do
      add :nome, :string
      add :data_nascimento, :date
      add :email, :string
      add :cpf, :string
      add :sexo, :integer
      add :telefone, :string
      add :endereco_id, references(:enderecos, on_delete: :nothing)

      timestamps()
    end

    create index(:clientes, [:endereco_id])
  end
end
