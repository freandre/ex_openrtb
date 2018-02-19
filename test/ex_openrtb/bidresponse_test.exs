defmodule ExOpenRTB.BidResponseTest do
  use ExUnit.Case, async: true
  import ExOpenRTB.Test

  test_decode(
    %ExOpenRTB.BidResponse{
      cur: "USD",
      id: "BID-4-ZIMP-4b309eae-504a-4252-a8a8-4c8ceee9791a",
      seatbid: [
        %ExOpenRTB.SeatBid{
          bid: [
            %ExOpenRTB.Bid{
              adid: "52a12b5955314b7194a4c9ff",
              adm: "<iframe />",
              adomain: ["ads.com"],
              attr: [],
              cid: "52a12b5955314b7194a4c9ff",
              crid: "52a12b5955314b7194a4c9ff_1386294105",
              dealid: "DX-1985-010A",
              id: "24195efda36066ee21f967bc1de14c82db841f07",
              impid: "24195efda36066ee21f967bc1de14c82db841f07",
              nurl: "http://ads.com/win/52a12b5955314b7194a4c9ff?won=${AUCTION_PRICE}",
              price: 1.028428
            }
          ],
          seat: "42"
        },
        %ExOpenRTB.SeatBid{
          bid: [
            %ExOpenRTB.Bid{
              adid: "527c9fdd55314ba06815f25e",
              adm: "<iframe />",
              adomain: ["ads.com"],
              attr: [],
              cid: "527c9fdd55314ba06815f25e",
              crid: "527c9fdd55314ba06815f25e_1383899102",
              id: "24195efda36066ee21f967bc1de14c82db841f08",
              impid: "24195efda36066ee21f967bc1de14c82db841f08",
              nurl: "http://ads.com/win/527c9fdd55314ba06815f25e?won=${AUCTION_PRICE}",
              price: 0.04958
            }
          ],
          seat: "772"
        }
      ]
    },
    :bidresponse,
    :"bres.multi"
  )

  test_decode(
    %ExOpenRTB.BidResponse{
      bidid: "abc1123",
      cur: "USD",
      id: "1234567890",
      seatbid: [
        %ExOpenRTB.SeatBid{
          bid: [
            %ExOpenRTB.Bid{
              adid: "314",
              adomain: ["advertiserdomain.com"],
              attr: [
                :audio_ad_auto_play,
                :audio_ad_user_initiated,
                :expandable_automatic,
                :expandable_user_initiated_click
              ],
              cid: "campaign111",
              crid: "creative112",
              dealid: "ABC-1234-6789",
              id: "1",
              impid: "102",
              iurl: "http: //adserver.com/pathtosampleimage",
              nurl: "http: //adserver.com/winnotice?impid=102",
              price: 5.0
            }
          ],
          seat: "512"
        }
      ]
    },
    :bidresponse,
    :"bres.pmp"
  )

  test_decode(
    %ExOpenRTB.BidResponse{
      cur: "USD",
      id: "BID-4-ZIMP-4b309eae-504a-4252-a8a8-4c8ceee9791a",
      seatbid: [
        %ExOpenRTB.SeatBid{
          bid: [
            %ExOpenRTB.Bid{
              adid: "529833ce55314b19e8796116",
              adm: "<iframe src=\"foo.bar\"/>",
              adomain: [],
              attr: [],
              cid: "529833ce55314b19e8796116",
              crid: "529833ce55314b19e8796116_1385706446",
              id: "32a69c6ba388f110487f9d1e63f77b22d86e916b",
              impid: "32a69c6ba388f110487f9d1e63f77b22d86e916b",
              nurl: "http://ads.com/win/529833ce55314b19e8796116?won=${auction_price}",
              price: 0.065445
            }
          ],
          seat: "772"
        }
      ]
    },
    :bidresponse,
    :"bres.single"
  )

  test_decode(
    %ExOpenRTB.BidResponse{
      id: "123",
      seatbid: [
        %ExOpenRTB.SeatBid{
          bid: [
            %ExOpenRTB.Bid{
              adm:
                "%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22utf-8%22%3F%3E%0A%3CVAST%20version%3D%222.0%22%3E%0A%20%20%20%20%3CAd%20id%3D%2212345%22%3E%0A%20%20%20%20%20%20%20%20%3CInLine%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3CAdSystem%20version%3D%221.0%22%3ESpotXchange%3C%2FAdSystem%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CAdTitle%3E%3C!%5BCDATA%5BSample%20VAST%5D%5D%3E%3C%2FAdTitle%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CImpression%3Ehttp%3A%2F%2Fsample.com%3C%2FImpression%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CDescription%3E%3C!%5BCDATA%5BA%20sample%20VAST%20feed%5D%5D%3E%3C%2FDescription%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CCreatives%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CCreative%20sequence%3D%221%22%20id%3D%221%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CLinear%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CDuration%3E00%3A00%3A30%3C%2FDuration%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CTrackingEvents%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2FTrackingEvents%3E%20%20%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CVideoClicks%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CClickThrough%3E%3C!%5BCDATA%5Bhttp%3A%2F%2Fsample.com%2Fopenrtbtest%5D%5D%3E%3C%2FClickThrough%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2FVideoClicks%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CMediaFiles%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CMediaFile%20delivery%3D%22progressive%22%20bitrate%3D%22256%22%20width%3D%22640%22%20height%3D%22480%22%20type%3D%22video%2Fmp4%22%3E%3C!%5BCDATA%5Bhttp%3A%2F%2Fsample.com%2Fvideo.mp4%5D%5D%3E%3C%2FMediaFile%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2FMediaFiles%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2FLinear%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2FCreative%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2FCreatives%3E%0A%20%20%20%20%20%20%20%20%3C%2FInLine%3E%0A%20%20%20%20%3C%2FAd%3E%0A%3C%2FVAST%3E",
              id: "12345",
              impid: "2",
              nurl: "http://example.com/winnoticeurl",
              price: 3.0
            }
          ]
        }
      ]
    },
    :bidresponse,
    :"bres.vast"
  )
end
