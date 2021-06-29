defmodule ShelterMap.Repo.Migrations.CreateShelters do
  use Ecto.Migration

  def change do
    create table(:shelters) do
      add :address, :string
      add :code, :string
      add :municipality, :string
      add :lat, :string
      add :lng, :string
      add :name, :string
      add :prefecture, :string

      timestamps()
    end

  end
end
