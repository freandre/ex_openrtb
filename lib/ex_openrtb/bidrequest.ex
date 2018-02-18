defmodule ExOpenRTB.BidRequest do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :id,
    :imp,
    :site,
    :app,
    :device,
    :user,
    :test,
    :at,
    :tmax,
    :wseat,
    :bseat,
    :allimps,
    :cur,
    :wlang,
    :bcat,
    :badv,
    :bapp,
    :source,
    :regs,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_default(:test, 0)
      |> map_default(:at, 2)
      |> map_default(:allimps, 0)
      |> map_const(:test, &ExOpenRTB.Constants.test/1)
      |> map_const(:at, &ExOpenRTB.Constants.auctiontype/1)
      |> map_const(:allimps, &ExOpenRTB.Constants.yesno/1)
      |> map_const_list(:bcat, &ExOpenRTB.Constants.content_category/1)
      |> map_decoder(:imp, [%ExOpenRTB.Imp{}])
      |> map_decoder(:site, %ExOpenRTB.Site{})
      |> map_decoder(:app, %ExOpenRTB.App{})
      |> map_decoder(:device, %ExOpenRTB.Device{})
      |> map_decoder(:user, %ExOpenRTB.User{})
      |> map_decoder(:source, %ExOpenRTB.Source{})
      |> map_decoder(:regs, %ExOpenRTB.Regs{})
    end
  end
end
