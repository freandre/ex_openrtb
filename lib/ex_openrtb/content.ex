defmodule ExOpenRTB.Content do
  import ExOpenRTB.Decoder.Helper

  defstruct [
    :id,
    :episode,
    :title,
    :series,
    :season,
    :artist,
    :genre,
    :album,
    :isrc,
    :producer,
    :url,
    :cat,
    :prodq,
    :videoquality,
    :context,
    :contentrating,
    :userrating,
    :qagmediarating,
    :keywords,
    :livestream,
    :sourcerelationship,
    :len,
    :language,
    :embeddable,
    :data,
    :ext
  ]

  defimpl Poison.Decoder do
    def decode(values, _options) do
      values
      |> map_const(:prodq, &ExOpenRTB.Constants.prodq/1)
      |> map_const(:videoquality, &ExOpenRTB.Constants.prodq/1)
      |> map_const(:context, &ExOpenRTB.Constants.context/1)
      |> map_const(:qagmediarating, &ExOpenRTB.Constants.igqmediaratings/1)
      |> map_const(:livestream, &ExOpenRTB.Constants.livestream/1)
      |> map_const(:sourcerelationship, &ExOpenRTB.Constants.sourcerelationship/1)
      |> map_const(:embeddable, &ExOpenRTB.Constants.yesno/1)
      |> map_const_list(:cat, &ExOpenRTB.Constants.content_category/1)
      |> map_decoder(:producer, %ExOpenRTB.Producer{})
      |> map_decoder(:data, [%ExOpenRTB.Data{}])
    end
  end
end
