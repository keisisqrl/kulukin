defmodule Kulukin.Repo.Migrations.CreateContainer do
  use Ecto.Migration

  def change do
    create table(:containers) do
      add :name, :string
      add :location, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:containers, [:user_id])

  end
end
