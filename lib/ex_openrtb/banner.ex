defmodule ExOpenRTB.Banner do
  use ExOpenRTB.Decoder.Macro
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :format,
    :w,
    :h,
    :wmax,
    :hmax,
    :wmin,
    :hmin,
    :btype,
    :battr,
    :pos,
    :mimes,
    :topframe,
    :expdir,
    :api,
    :id,
    :vcm,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_decoder(:format, [%ExOpenRTB.Format{}])
      |> map_const(:pos, &ExOpenRTB.Constants.pos/1)
      |> map_const(:topframe, &ExOpenRTB.Constants.yesno/1)
      |> map_const(:vcm, &ExOpenRTB.Constants.vcm/1)
      |> map_const_list(:btype, &ExOpenRTB.Constants.bannertype/1)
      |> map_const_list(:battr, &ExOpenRTB.Constants.attr/1)
      |> map_const_list(:expdir, &ExOpenRTB.Constants.expdir/1)
      |> map_const_list(:expdir, &ExOpenRTB.Constants.api/1)
    end
  end
end
