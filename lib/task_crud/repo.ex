defmodule TaskCrud.Repo do
  use Ecto.Repo,
    otp_app: :task_crud,
    adapter: Ecto.Adapters.Postgres
end
