defmodule Self.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nome, :string
      add :provider, :string
      add :email, :string
      add :token, :string

      timestamps()
    end

  end
end
