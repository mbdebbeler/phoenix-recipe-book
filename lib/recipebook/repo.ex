defmodule Recipebook.Repo do
  use Ecto.Repo,
    otp_app: :recipebook,
    adapter: Ecto.Adapters.Postgres
end
