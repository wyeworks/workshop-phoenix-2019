defmodule TrelloApi.Repo do
  use Ecto.Repo,
    otp_app: :trello_api,
    adapter: Ecto.Adapters.Postgres
end
