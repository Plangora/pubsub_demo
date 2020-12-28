defmodule PubsubDemo.Repo do
  use Ecto.Repo,
    otp_app: :pubsub_demo,
    adapter: Ecto.Adapters.Postgres
end
