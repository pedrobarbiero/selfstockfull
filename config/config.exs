# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :self,
  ecto_repos: [Self.Repo]

# Configures the endpoint
config :self, SelfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "797WTecuNZ7WjKX+hawNzymX3bDNAPm81m/FnLPtiARr//X1XxsILkE5ACULdVP/",
  render_errors: [view: SelfWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Self.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile plus.me"]},
    facebook:
      {Ueberauth.Strategy.Facebook,
       [
         default_scope: "email,public_profile,user_friends",
         display: "popup"
       ]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: "938621225930-7pia57anotltoqishk3kp90i1nibomao.apps.googleusercontent.com",
  client_secret: "typQc8_Nzv0PUnXZL4vSneoD"

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: "357802244825104",
  client_secret: "726e9eecba8776eaac9af9987bf6cd37"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
