defmodule ExOpenRTB.Pmp do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :private_auction,
    :deals,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_default(:private_auction, 0)
      |> map_decoder(:deals, [%ExOpenRTB.Deal{}])
    end
  end
end
