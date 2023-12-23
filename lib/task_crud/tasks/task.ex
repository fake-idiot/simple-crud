defmodule TaskCrud.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:description, :title, :status, :priority, :due_date]}
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
    |> cast(attrs, [:title, :description, :status, :priority, :due_date])
    |> validate_required([:title, :description, :status, :priority])
  end
end
