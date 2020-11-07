defmodule CrmBackend.Settings.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :email, :string
    field :name, :string
    field :phone_no, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :phone_no, :email])
    |> validate_required([:name, :phone_no, :email])
  end
end
