defmodule TaskCrud.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :title, :string
    field :status, Ecto.Enum, values: [:todo, :in_progress, :completed]
    field :priority, Ecto.Enum, values: [:high, :medium, :low]
    field :due_date, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status, :priority])
    |> validate_required([:title, :description, :status, :priority])
  end
end
