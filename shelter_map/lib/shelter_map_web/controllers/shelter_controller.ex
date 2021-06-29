defmodule ShelterMapWeb.ShelterController do
  use ShelterMapWeb, :controller

  alias ShelterMap.Sheltermap
  alias ShelterMap.Sheltermap.Shelter

  def index(conn, _params) do
    shelters = Sheltermap.list_shelters()
    render(conn, "index.html", shelters: shelters)
  end

  def new(conn, _params) do
    changeset = Sheltermap.change_shelter(%Shelter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"shelter" => shelter_params}) do
    case Sheltermap.create_shelter(shelter_params) do
      {:ok, shelter} ->
        conn
        |> put_flash(:info, "Shelter created successfully.")
        |> redirect(to: Routes.shelter_path(conn, :show, shelter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shelter = Sheltermap.get_shelter!(id)
    render(conn, "show.html", shelter: shelter)
  end

  def edit(conn, %{"id" => id}) do
    shelter = Sheltermap.get_shelter!(id)
    changeset = Sheltermap.change_shelter(shelter)
    render(conn, "edit.html", shelter: shelter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "shelter" => shelter_params}) do
    shelter = Sheltermap.get_shelter!(id)

    case Sheltermap.update_shelter(shelter, shelter_params) do
      {:ok, shelter} ->
        conn
        |> put_flash(:info, "Shelter updated successfully.")
        |> redirect(to: Routes.shelter_path(conn, :show, shelter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", shelter: shelter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shelter = Sheltermap.get_shelter!(id)
    {:ok, _shelter} = Sheltermap.delete_shelter(shelter)

    conn
    |> put_flash(:info, "Shelter deleted successfully.")
    |> redirect(to: Routes.shelter_path(conn, :index))
  end
end
