defmodule ExOpenRTB.Imp do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :id,
    :metric,
    :banner,
    :video,
    :audio,
    :native,
    :pmp,
    :displaymanager,
    :displaymanagerver,
    :instl,
    :tagid,
    :bidfloor,
    :bidfloorcur,
    :clickbrowser,
    :secure,
    :iframebuster,
    :exp,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_default(:instl, 0)
      |> map_default(:bidfloor, 0)
      |> map_default(:bidfloorcur, "USD")
      |> map_const(:instl, &ExOpenRTB.Constants.instl/1)
      |> map_const(:clickbrowser, &ExOpenRTB.Constants.clickbrowser/1)
      |> map_const(:secure, &ExOpenRTB.Constants.secure/1)
      |> map_decoder(:metric, [%ExOpenRTB.Metric{}])
      |> map_decoder(:banner, %ExOpenRTB.Banner{})
      |> map_decoder(:video, %ExOpenRTB.Video{})
      |> map_decoder(:audio, %ExOpenRTB.Audio{})
      |> map_decoder(:native, %ExOpenRTB.Native{})
      |> map_decoder(:pmp, %ExOpenRTB.Pmp{})
    end
  end
end
