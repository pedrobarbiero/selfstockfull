defmodule Self.Repo.Migrations.CreateVendas do
  use Ecto.Migration

  def change do
    create table(:vendas) do
      add :valor, :decimal
      add :data, :date
      add :desconto, :decimal
      add :funcionario_id, references(:funcionarios, on_delete: :nothing)
      add :cliente_id, references(:clientes, on_delete: :nothing)

      timestamps()
    end

    create index(:vendas, [:funcionario_id])
    create index(:vendas, [:cliente_id])
  end
end
