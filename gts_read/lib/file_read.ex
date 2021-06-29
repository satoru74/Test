defmodule FileRead do

  def gts_read do
    Path.expand("~/Test/gts_read/lib/cube.gts")
    |> File.stream!
    |> CSV.decode!()
    |> Enum.to_list()
  end


  def to_map do
    head = hd(gts_read())
    list = tl(gts_read())

    list1 = Enum.into( List.zip( [["頂点の数 線分の数 三角形の数"], head] ), %{} )
    list2 = list |> Enum.slice(1..8) |> Enum.map(&List.zip([["x成分値 y成分値 z成分値"],&1])) |> Enum.map(&Enum.into(&1, %{}))
    list3 = list |> Enum.slice(9..26) |> Enum.map(&List.zip([["x始点の頂点番号 終点の頂点番号"],&1])) |> Enum.map(&Enum.into(&1, %{}))
    list4 = list |> Enum.slice(27..39) |> Enum.map(&List.zip([["x１点目の線分番号 ２点目の線分番号 ３点目の線分番号"],&1])) |> Enum.map(&Enum.into(&1, %{}))

    List.flatten([list1, list2, list3, list4])
  end

  def to_json do
    Jason.encode!(to_map())
  end




end
