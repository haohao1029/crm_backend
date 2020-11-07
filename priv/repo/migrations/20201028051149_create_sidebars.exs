defmodule CrmBackend.Repo.Migrations.CreateSidebars do
  use Ecto.Migration

  def change do
    create table(:sidebars) do
      add :path, :string
      add :title, :string
      add :icontype, :string
      add :collapse, :string
      add :parent_sidebar, :integer

      timestamps()
    end

  end
end
