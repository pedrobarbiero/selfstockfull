defmodule Self.Repo.Migrations.CreateFornecedores do
  use Ecto.Migration

  def change do
    create table(:fornecedores) do
      add :nome_fantasia, :string
      add :razao_social, :string
      add :email, :string
      add :cnpj, :string
      add :telefone, :string
      add :inscrica_estadual, :string
      add :endereco_id, references(:enderecos, on_delete: :nothing)

      timestamps()
    end

    create index(:fornecedores, [:endereco_id])
  end
end
