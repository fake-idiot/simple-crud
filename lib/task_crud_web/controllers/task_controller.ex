defmodule TaskCrudWeb.TaskController do
  use TaskCrudWeb, :controller

  alias TaskCrud.Tasks
  alias TaskCrud.Tasks.Task

  def index(conn, _) do
    json(conn, Tasks.list_tasks)
  end

  def show(conn, %{"id" => id}) do
    with %Task{} = task <-  Tasks.get_task!(id) do
      json(conn, task)
    else
      _ ->
        json(conn, "There is no Task against the ID: #{id}")
    end
  end

  def create(conn, params) do
    with {:ok, %Task{} = task} <-  Tasks.create_task(params) do
      json(conn, task)
    else
      {:error, %Ecto.Changeset{}} ->
        json(conn, "Please check params before creating task")
      _ ->
        json(conn, "Something went wrong while creating task")
    end
  end

  def update(conn, %{"id" => id} = params) do
    with %Task{} = task <-  Tasks.get_task!(id),
      {:ok, %Task{} = task} <-  Tasks.update_task(task, params) do
      json(conn, task)
    else
      {:error, %Ecto.Changeset{}} ->
        json(conn, "Please check params before updating task")
      _ ->
        json(conn, "Something went wrong while updating task")
    end
  end

  def delete(conn, %{"id" => id}) do
    with %Task{} = task <-  Tasks.get_task!(id),
      {:ok, %Task{}} <-  Tasks.delete_task(task) do
      json(conn, "Task has been deleted")
    else
      _ ->
        json(conn, "Something went wrong while deleting task")
    end
  end
end
