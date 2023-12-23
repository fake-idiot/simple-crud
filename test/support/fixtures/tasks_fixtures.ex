defmodule TaskCrud.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TaskCrud.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> TaskCrud.Tasks.create_task()

    task
  end
end
