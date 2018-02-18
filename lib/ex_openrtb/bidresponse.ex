defmodule ExOpenRTB.BidResponse do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :id,
    :seatbid,
    :bidid,
    :cur,
    :customdata,
    :nbr,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_default(:cur, "USD")
      |> map_const(:nbr, &ExOpenRTB.Constants.nobidreasoncode/1)
      |> map_decoder(:seatbid, [%ExOpenRTB.SeatBid{}])
    end
  end
end
