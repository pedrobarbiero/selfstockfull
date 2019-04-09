defmodule Self.Repo.Migrations.CreateCompras do
  use Ecto.Migration

  def change do
    create table(:compras) do
      add :numero, :string
      add :data, :date
      add :icms, :string
      add :desconto, :decimal
      add :vencimento, :date
      add :funcionario_id, references(:funcionarios, on_delete: :nothing)
      add :fornecedor_id, references(:fornecedores, on_delete: :nothing)

      timestamps()
    end

    create index(:compras, [:funcionario_id])
    create index(:compras, [:fornecedor_id])
  end
end
