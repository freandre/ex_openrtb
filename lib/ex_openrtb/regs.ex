defmodule ExOpenRTB.Regs do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :coppa,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_const(:yesno, &ExOpenRTB.Constants.yesno/1)
    end
  end
end
