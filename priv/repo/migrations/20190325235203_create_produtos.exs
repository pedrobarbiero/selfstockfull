defmodule Self.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :nome, :string
      add :descricao, :string
      add :valor_compra, :decimal
      add :valor_venda, :decimal
      add :tipo, :integer

      timestamps()
    end

  end
end
