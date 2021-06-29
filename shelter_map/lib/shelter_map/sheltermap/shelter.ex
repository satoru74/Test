defmodule ShelterMap.Sheltermap.Shelter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelters" do
    field :address, :string
    field :code, :string
    field :lat, :string
    field :lng, :string
    field :municipality, :string
    field :name, :string
    field :prefecture, :string

    timestamps()
  end

  @doc false
  def changeset(shelter, attrs) do
    shelter
    |> cast(attrs, [:address, :code, :municipality, :lat, :lng, :name, :prefecture])
    |> validate_required([:address, :code, :municipality, :lat, :lng, :name, :prefecture])
  end
end
