defmodule ShelterMapWeb.ShelterControllerTest do
  use ShelterMapWeb.ConnCase

  alias ShelterMap.Sheltermap

  @create_attrs %{address: "some address", code: "some code", lat: "some lat", lng: "some lng", municipality: "some municipality", name: "some name", prefecture: "some prefecture"}
  @update_attrs %{address: "some updated address", code: "some updated code", lat: "some updated lat", lng: "some updated lng", municipality: "some updated municipality", name: "some updated name", prefecture: "some updated prefecture"}
  @invalid_attrs %{address: nil, code: nil, lat: nil, lng: nil, municipality: nil, name: nil, prefecture: nil}

  def fixture(:shelter) do
    {:ok, shelter} = Sheltermap.create_shelter(@create_attrs)
    shelter
  end

  describe "index" do
    test "lists all shelters", %{conn: conn} do
      conn = get(conn, Routes.shelter_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Shelters"
    end
  end

  describe "new shelter" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.shelter_path(conn, :new))
      assert html_response(conn, 200) =~ "New Shelter"
    end
  end

  describe "create shelter" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shelter_path(conn, :create), shelter: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.shelter_path(conn, :show, id)

      conn = get(conn, Routes.shelter_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Shelter"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shelter_path(conn, :create), shelter: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Shelter"
    end
  end

  describe "edit shelter" do
    setup [:create_shelter]

    test "renders form for editing chosen shelter", %{conn: conn, shelter: shelter} do
      conn = get(conn, Routes.shelter_path(conn, :edit, shelter))
      assert html_response(conn, 200) =~ "Edit Shelter"
    end
  end

  describe "update shelter" do
    setup [:create_shelter]

    test "redirects when data is valid", %{conn: conn, shelter: shelter} do
      conn = put(conn, Routes.shelter_path(conn, :update, shelter), shelter: @update_attrs)
      assert redirected_to(conn) == Routes.shelter_path(conn, :show, shelter)

      conn = get(conn, Routes.shelter_path(conn, :show, shelter))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, shelter: shelter} do
      conn = put(conn, Routes.shelter_path(conn, :update, shelter), shelter: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Shelter"
    end
  end

  describe "delete shelter" do
    setup [:create_shelter]

    test "deletes chosen shelter", %{conn: conn, shelter: shelter} do
      conn = delete(conn, Routes.shelter_path(conn, :delete, shelter))
      assert redirected_to(conn) == Routes.shelter_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.shelter_path(conn, :show, shelter))
      end
    end
  end

  defp create_shelter(_) do
    shelter = fixture(:shelter)
    %{shelter: shelter}
  end
end
