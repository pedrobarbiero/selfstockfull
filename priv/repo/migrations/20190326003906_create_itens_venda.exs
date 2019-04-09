defmodule Self.Repo.Migrations.CreateItensVenda do
  use Ecto.Migration

  def change do
    create table(:itens_venda) do
      add :quantidade, :integer
      add :venda_id, references(:vendas, on_delete: :nothing)
      add :produto_id, references(:produtos, on_delete: :nothing)

      timestamps()
    end

    create index(:itens_venda, [:venda_id])
    create index(:itens_venda, [:produto_id])
  end
end
