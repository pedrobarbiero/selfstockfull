defmodule Self.Repo.Migrations.CreateEstados do
  use Ecto.Migration

  def change do
    create table(:estados) do
      add :nome, :string
      add :uf, :string
      add :pais_id, references(:paises, on_delete: :nothing)

      timestamps()
    end

    create index(:estados, [:pais_id])
  end
end
