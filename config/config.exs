# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :techevents,
  ecto_repos: [Techevents.Repo],
  eventbrite_token: "still invalid"

# Configures the endpoint
config :techevents, TecheventsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VSW1UtuaIiiFf/sblzb7/kzUF6zu8OfG24XVlEbgeJcldxMFS8gz91mJmNta7rBR",
  render_errors: [view: TecheventsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Techevents.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
