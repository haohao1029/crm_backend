defmodule CrmBackend.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :phone_no, :string
      add :email, :string
      add :owner, :string

      timestamps()
    end

  end
end
