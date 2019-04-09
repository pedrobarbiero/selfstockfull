defmodule Self.Repo.Migrations.FuncionarioAddUsuario do
  use Ecto.Migration

  def change do
    alter table(:usuarios) do
      add :funcionario_id, references(:funcionarios)
    end
  end
end
