defmodule ExOpenRTB.Bid do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :id,
    :impid,
    :price,
    :nurl,
    :burl,
    :lurl,
    :adm,
    :adid,
    :adomain,
    :bundle,
    :iurl,
    :cid,
    :crid,
    :tactic,
    :cat,
    :attr,
    :api,
    :protocol,
    :qagmediarating,
    :language,
    :dealid,
    :w,
    :h,
    :wratio,
    :hratio,
    :exp,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_const(:api, &ExOpenRTB.Constants.api/1)
      |> map_const(:protocol, &ExOpenRTB.Constants.protocol/1)
      |> map_const(:qagmediarating, &ExOpenRTB.Constants.igqmediaratings/1)
      |> map_const_list(:cat, &ExOpenRTB.Constants.content_category/1)
      |> map_const_list(:attr, &ExOpenRTB.Constants.attr/1)
    end
  end
end
