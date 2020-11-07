defmodule CrmBackend.Repo do
  use Ecto.Repo,
    otp_app: :crm_backend,
    adapter: Ecto.Adapters.Postgres
end
