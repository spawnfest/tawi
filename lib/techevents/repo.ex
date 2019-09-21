defmodule Techevents.Repo do
  use Ecto.Repo,
    otp_app: :techevents,
    adapter: Ecto.Adapters.Postgres
end
