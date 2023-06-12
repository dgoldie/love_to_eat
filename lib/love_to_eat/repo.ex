defmodule LoveToEat.Repo do
  use Ecto.Repo,
    otp_app: :love_to_eat,
    adapter: Ecto.Adapters.Postgres
end
