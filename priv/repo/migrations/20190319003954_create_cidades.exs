defmodule Self.Repo.Migrations.CreateCidades do
  use Ecto.Migration

  def change do
    create table(:cidades) do
      add :nome, :string
      add :estado_id, references(:estados, on_delete: :nothing)

      timestamps()
    end

    create index(:cidades, [:estado_id])
  end
end
