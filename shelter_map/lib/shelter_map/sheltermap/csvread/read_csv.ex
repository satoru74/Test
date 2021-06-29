defmodule ShelterMap.Sheltermap.CsvRead do

  alias ShelterMap.Repo

  alias ShelterMap.Sheltermap.Shelte

def read do
  Path.expand("../shelter_map/lib/shelter_map/sheltermap/csvread/130001_evacuation_center.csv")
  |> File.stream!
  |> CSV.decode!(headers: [:name,:code,:prefecture,:municipality,:address,:lat,:lng])
  |> Enum.to_list()
end

def regist do
  for x <- read() do
    shelters = %ShelterMap.Sheltermap.Shelter{}
    changeset = Map.merge(shelters, x)
    |> Repo.insert()
  end

end

end
