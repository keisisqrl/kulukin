# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kulukin,
  ecto_repos: [Kulukin.Repo]

# Configures the endpoint
config :kulukin, Kulukin.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4SwI31zLP0NM+v6sLeNWtkhgTvXts9M5NcL07NkIIrvcUR0+gt7Z4yLrVQde3DKJ",
  render_errors: [view: Kulukin.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kulukin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Kulukin.User,
  repo: Kulukin.Repo,
  module: Kulukin,
  logged_out_url: "/",
  email_from_name: "Kulukin",
  email_from_email: "kulukin@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :confirmable, :registerable]

config :coherence, Kulukin.Coherence.Mailer,
  adapter: Swoosh.Adapters.Logger
# %% End Coherence Configuration %%
