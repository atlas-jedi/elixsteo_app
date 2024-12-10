defmodule ElixsteoApp.Repo do
  use Ecto.Repo,
    otp_app: :elixsteo_app,
    adapter: Ecto.Adapters.Postgres
end
