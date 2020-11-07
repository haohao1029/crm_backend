defmodule CrmBackend.Settings.Sidebar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sidebars" do
    field :collapse, :string
    field :icontype, :string
    field :parent_sidebar, :integer
    field :path, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(sidebar, attrs) do
    sidebar
    |> cast(attrs, [:path, :title, :icontype, :collapse, :parent_sidebar])
    |> validate_required([:path, :title, :icontype, :collapse, :parent_sidebar])
  end
end
