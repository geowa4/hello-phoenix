# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hello_phoenix,
  ecto_repos: [HelloPhoenix.Repo]

config :hello_phoenix, HelloPhoenix.Repo,
  loggers: [HelloPhoenix.Repo.Instrumenter, Ecto.LogEntry]

config :prometheus, HelloPhoenix.Plug.MetricsExporter,
  path: "/metrics",
  format: :text,
  registry: :default

# Configures the endpoint
config :hello_phoenix, HelloPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S7giM34Hn1hWSGixboICdD9w44Cp2e/sOzI3KSJj6E2UcOIybzLCTR1caqWz/N6C",
  render_errors: [view: HelloPhoenix.ErrorView, accepts: ~w(html json)],
  instrumenters: [HelloPhoenix.Endpoint.Instrumenter],
  pubsub: [name: HelloPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :plug_logger_json,
  filtered_keys: ["password", "authorization"]

config :logger, :console,
  format: "$message\n",
  level: :info,
  metadata: [:request_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
