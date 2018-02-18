defmodule ExOpenRTB.Deal do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :id,
    :bidfloor,
    :bidfloorcur,
    :at,
    :wseat,
    :wadomain,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_default(:bidfloor, 0)
      |> map_default(:bidfloorcur, "USD")
      |> map_const(:at, &ExOpenRTB.Constants.auctiontype/1)
    end
  end
end
