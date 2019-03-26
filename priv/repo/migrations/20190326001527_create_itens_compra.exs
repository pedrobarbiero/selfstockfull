defmodule Self.Repo.Migrations.CreateItensCompra do
  use Ecto.Migration

  def change do
    create table(:itens_compra) do
      add :quantidade, :integer
      add :valor_unitario, :decimal
      add :produto_id, references(:produtos, on_delete: :nothing)
      add :compra_id, references(:compras, on_delete: :nothing)

      timestamps()
    end

    create index(:itens_compra, [:produto_id])
    create index(:itens_compra, [:compra_id])
  end
end
