defmodule ExOpenRTB.Source do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :fd,
    :tid,
    :pchain,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_const(:fd, &ExOpenRTB.Constants.fd/1)
    end
  end
end
