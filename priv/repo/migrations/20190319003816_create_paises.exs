defmodule Self.Repo.Migrations.CreatePaises do
  use Ecto.Migration

  def change do
    create table(:paises) do
      add :nome, :string

      timestamps()
    end

  end
end
