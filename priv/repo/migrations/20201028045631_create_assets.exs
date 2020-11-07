defmodule CrmBackend.Repo.Migrations.CreateAssets do
  use Ecto.Migration

  def change do
    create table(:assets) do
      add :name, :string
      add :price, :float

      timestamps()
    end

  end
end
