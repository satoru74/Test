defmodule ShelterMap.Sheltermap do
  @moduledoc """
  The Sheltermap context.
  """

  import Ecto.Query, warn: false
  alias ShelterMap.Repo

  alias ShelterMap.Sheltermap.Shelter

  @doc """
  Returns the list of shelters.

  ## Examples

      iex> list_shelters()
      [%Shelter{}, ...]

  """
  def list_shelters do
    Repo.all(Shelter)
  end

  @doc """
  Gets a single shelter.

  Raises `Ecto.NoResultsError` if the Shelter does not exist.

  ## Examples

      iex> get_shelter!(123)
      %Shelter{}

      iex> get_shelter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shelter!(id), do: Repo.get!(Shelter, id)

  @doc """
  Creates a shelter.

  ## Examples

      iex> create_shelter(%{field: value})
      {:ok, %Shelter{}}

      iex> create_shelter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shelter(attrs \\ %{}) do
    %Shelter{}
    |> Shelter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shelter.

  ## Examples

      iex> update_shelter(shelter, %{field: new_value})
      {:ok, %Shelter{}}

      iex> update_shelter(shelter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shelter(%Shelter{} = shelter, attrs) do
    shelter
    |> Shelter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shelter.

  ## Examples

      iex> delete_shelter(shelter)
      {:ok, %Shelter{}}

      iex> delete_shelter(shelter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shelter(%Shelter{} = shelter) do
    Repo.delete(shelter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shelter changes.

  ## Examples

      iex> change_shelter(shelter)
      %Ecto.Changeset{data: %Shelter{}}

  """
  def change_shelter(%Shelter{} = shelter, attrs \\ %{}) do
    Shelter.changeset(shelter, attrs)
  end
end
