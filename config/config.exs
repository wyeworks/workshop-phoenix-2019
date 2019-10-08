# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :trello_api,
  ecto_repos: [TrelloApi.Repo]

# Configures the endpoint
config :trello_api, TrelloApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qe5vDmZZWRoTMTAmYGdIKeEE0Vzw11eM9RiJ1mWUGB2hKX1bLYvo/zkwk0HVauGF",
  render_errors: [view: TrelloApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: TrelloApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
