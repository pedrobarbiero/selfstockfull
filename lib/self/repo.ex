defmodule Self.Repo do
  use Ecto.Repo,
    otp_app: :self,
    adapter: Ecto.Adapters.Postgres
end
