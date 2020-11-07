defmodule CrmBackend.Settings.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :email, :string
    field :name, :string
    field :owner, :string
    field :phone_no, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :phone_no, :email, :owner])
    |> validate_required([:name, :phone_no, :email, :owner])
  end
end
