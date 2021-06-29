defmodule ShelterMap.SheltermapTest do
  use ShelterMap.DataCase

  alias ShelterMap.Sheltermap

  describe "shelters" do
    alias ShelterMap.Sheltermap.Shelter

    @valid_attrs %{address: "some address", code: "some code", lat: "some lat", lng: "some lng", municipality: "some municipality", name: "some name", prefecture: "some prefecture"}
    @update_attrs %{address: "some updated address", code: "some updated code", lat: "some updated lat", lng: "some updated lng", municipality: "some updated municipality", name: "some updated name", prefecture: "some updated prefecture"}
    @invalid_attrs %{address: nil, code: nil, lat: nil, lng: nil, municipality: nil, name: nil, prefecture: nil}

    def shelter_fixture(attrs \\ %{}) do
      {:ok, shelter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sheltermap.create_shelter()

      shelter
    end

    test "list_shelters/0 returns all shelters" do
      shelter = shelter_fixture()
      assert Sheltermap.list_shelters() == [shelter]
    end

    test "get_shelter!/1 returns the shelter with given id" do
      shelter = shelter_fixture()
      assert Sheltermap.get_shelter!(shelter.id) == shelter
    end

    test "create_shelter/1 with valid data creates a shelter" do
      assert {:ok, %Shelter{} = shelter} = Sheltermap.create_shelter(@valid_attrs)
      assert shelter.address == "some address"
      assert shelter.code == "some code"
      assert shelter.lat == "some lat"
      assert shelter.lng == "some lng"
      assert shelter.municipality == "some municipality"
      assert shelter.name == "some name"
      assert shelter.prefecture == "some prefecture"
    end

    test "create_shelter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sheltermap.create_shelter(@invalid_attrs)
    end

    test "update_shelter/2 with valid data updates the shelter" do
      shelter = shelter_fixture()
      assert {:ok, %Shelter{} = shelter} = Sheltermap.update_shelter(shelter, @update_attrs)
      assert shelter.address == "some updated address"
      assert shelter.code == "some updated code"
      assert shelter.lat == "some updated lat"
      assert shelter.lng == "some updated lng"
      assert shelter.municipality == "some updated municipality"
      assert shelter.name == "some updated name"
      assert shelter.prefecture == "some updated prefecture"
    end

    test "update_shelter/2 with invalid data returns error changeset" do
      shelter = shelter_fixture()
      assert {:error, %Ecto.Changeset{}} = Sheltermap.update_shelter(shelter, @invalid_attrs)
      assert shelter == Sheltermap.get_shelter!(shelter.id)
    end

    test "delete_shelter/1 deletes the shelter" do
      shelter = shelter_fixture()
      assert {:ok, %Shelter{}} = Sheltermap.delete_shelter(shelter)
      assert_raise Ecto.NoResultsError, fn -> Sheltermap.get_shelter!(shelter.id) end
    end

    test "change_shelter/1 returns a shelter changeset" do
      shelter = shelter_fixture()
      assert %Ecto.Changeset{} = Sheltermap.change_shelter(shelter)
    end
  end
end
