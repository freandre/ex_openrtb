defmodule ExOpenRTB.SeatBid do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :bid,
    :seat,
    :group,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_default(:group, 0)
      |> map_const(:group, &ExOpenRTB.Constants.group/1)
      |> map_decoder(:bid, [%ExOpenRTB.Bid{}])
    end
  end
end
