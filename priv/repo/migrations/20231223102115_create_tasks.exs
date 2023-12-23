defmodule TaskCrud.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :description, :text
      add :title, :string
      add :status, :string
      add :priority, :string
      add :due_date, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:tasks, [:title])
  end
end
