defmodule ExOpenRTB.BidRequestTest do
  use ExUnit.Case, async: true
  import ExOpenRTB.Test

  test_decode(
    %ExOpenRTB.BidRequest{
      at: :second_price,
      badv: ["company1.com", "company2.com"],
      device: %ExOpenRTB.Device{
        flashver: "10.1",
        ip: "64.124.253.1",
        js: true,
        os: "OS X",
        ua:
          "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16"
      },
      id: "1234534625254",
      imp: [
        %ExOpenRTB.Imp{
          banner: %ExOpenRTB.Banner{
            battr: [:user_interactive],
            h: 250,
            pos: :above_fold,
            w: 300
          },
          id: "1"
        }
      ],
      site: %ExOpenRTB.Site{
        cat: ["Auto Parts", "Auto Repair"],
        content: %ExOpenRTB.Content{
          keywords: "keyword a,keyword b,keyword c"
        },
        domain: "siteabcd.com",
        id: "234563",
        name: "Site ABCD",
        page: "http://siteabcd.com/page.htm",
        privacypolicy: true,
        publisher: %ExOpenRTB.Publisher{
          id: "pub12345",
          name: "Publisher A"
        },
        ref: "http://referringsite.com/referringpage.htm"
      },
      test: :test,
      tmax: 120,
      user: %ExOpenRTB.User{
        buyeruid: "5df678asd8987656asdf78987654",
        id: "45asdf987656789adfad4678rew656789"
      }
    },
    :bidrequest,
    :"breq.banner"
  )

  test_decode(
    %ExOpenRTB.BidRequest{
      at: :second_price,
      device: %ExOpenRTB.Device{
        flashver: "10.1",
        ip: "64.124.253.1",
        js: true,
        os: "OS X",
        ua:
          "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16"
      },
      id: "1234567893",
      imp: [
        %ExOpenRTB.Imp{
          banner: %ExOpenRTB.Banner{
            battr: [:user_interactive],
            expdir: [:exp_dir_right, :exp_dir_down],
            h: 250,
            hmin: 250,
            pos: :above_fold,
            w: 300,
            wmin: 300
          },
          id: "1",
          iframebuster: ["vendor1.com", "vendor2.com"]
        }
      ],
      site: %ExOpenRTB.Site{
        content: %ExOpenRTB.Content{
          keywords: "keyword1,keyword2,keyword3"
        },
        domain: "siteabcd.com",
        id: "1345135123",
        name: "Site ABCD",
        page: "http://siteabcd.com/page.htm",
        privacypolicy: true,
        publisher: %ExOpenRTB.Publisher{
          id: "pub12345",
          name: "Publisher A"
        },
        ref: "http://referringsite.com/referringpage.htm"
      },
      tmax: 120,
      user: %ExOpenRTB.User{
        buyeruid: "545678765467876567898765678987654",
        data: [
          %ExOpenRTB.Data{
            id: "6",
            name: "Data Provider 1",
            segment: [
              %ExOpenRTB.Segment{id: "12341318394918", name: "auto intenders"},
              %ExOpenRTB.Segment{id: "1234131839491234", name: "auto enthusiasts"},
              %ExOpenRTB.Segment{
                id: "23423424",
                name: "data-provider1-age",
                value: "30-40"
              }
            ]
          }
        ],
        id: "456789876567897654678987656789"
      }
    },
    :bidrequest,
    :"breq.exp"
  )

  test_decode(
    %ExOpenRTB.BidRequest{
      at: :first_price,
      cur: ["USD"],
      device: %ExOpenRTB.Device{
        ip: "123.145.167.10",
        js: nil,
        ua:
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2"
      },
      id: "80ce30c53c16e6ede735f123ef6e32361bfc7b22",
      imp: [
        %ExOpenRTB.Imp{
          bidfloor: 0.03,
          id: "1",
          native: %ExOpenRTB.Native{
            api: [:mraid_1],
            battr: [:user_interactive, :windows_dialog_or_alert_style],
            request: "...Native Spec request as an encoded string...",
            ver: "1.0"
          }
        }
      ],
      site: %ExOpenRTB.Site{
        cat: ["Advertising"],
        domain: "www.foobar.com",
        id: "102855",
        page: "http://www.foobar.com/1234.html ",
        publisher: %ExOpenRTB.Publisher{
          cat: ["Advertising"],
          domain: "foobar.com",
          id: "8953",
          name: "foobar.com"
        }
      },
      user: %ExOpenRTB.User{
        id: "55816b39711f9b5acf3b90e313ed29e51665623f"
      }
    },
    :bidrequest,
    :"breq.native"
  )

  test_decode(
    %ExOpenRTB.BidRequest{
      at: :second_price,
      tmax: 120,
      device: %ExOpenRTB.Device{
        ip: "64.124.253.1",
        js: true,
        os: "OS X",
        ua:
          "Mozilla/5.0 (Mac; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.16) Gecko/20140420 Firefox/3.6.16"
      },
      id: "0123456789ABCDEF0123456789ABCDEF",
      imp: [
        %ExOpenRTB.Imp{
          id: "1",
          pmp: %ExOpenRTB.Pmp{
            deals: [
              %ExOpenRTB.Deal{
                at: :first_price,
                bidfloor: 5.3,
                ext: %{"priority" => 1, "wadvs" => []},
                id: "1452f.eadb4.7aaa"
              }
            ],
            private_auction: 1
          },
          video: %ExOpenRTB.Video{
            api: [:vpaid_1, :vpaid_2],
            battr: [:user_interactive, :windows_dialog_or_alert_style],
            boxingallowed: true,
            delivery: [:progressive],
            h: 480,
            linearity: :linear,
            maxbitrate: 1500,
            maxduration: 30,
            mimes: [
              "video/x-flv",
              "video/mp4",
              "application/x-shockwave-flash",
              "application/javascript"
            ],
            minbitrate: 300,
            minduration: 5,
            playbackmethod: [:auto_play_sound_on],
            pos: :above_fold,
            protocols: [:vast_2, :vast_3],
            sequence: 1,
            startdelay: 0,
            w: 640
          }
        },
        %ExOpenRTB.Imp{
          id: "2",
          pmp: %ExOpenRTB.Pmp{
            deals: [
              %ExOpenRTB.Deal{
                at: :first_price,
                bidfloor: 3.5,
                ext: %{"priority" => 1, "wadvs" => []},
                id: "1452f.eadb4.7aaa"
              },
              %ExOpenRTB.Deal{
                at: :first_price,
                bidfloor: 2.5,
                ext: %{"priority" => 2, "wadvs" => []},
                id: "1452f.eadb4.f9bc"
              }
            ],
            private_auction: 1
          },
          video: %ExOpenRTB.Video{
            api: [:vpaid_1, :vpaid_2],
            battr: [:user_interactive, :windows_dialog_or_alert_style],
            boxingallowed: true,
            delivery: [:progressive],
            h: 480,
            linearity: :linear,
            maxbitrate: 1500,
            maxduration: 60,
            mimes: [
              "video/x-flv",
              "video/mp4",
              "application/x-shockwave-flash",
              "application/javascript"
            ],
            minbitrate: 300,
            minduration: 30,
            playbackmethod: [:auto_play_sound_on],
            pos: :above_fold,
            protocols: [:vast_2, :vast_3],
            sequence: 2,
            startdelay: 300,
            w: 640
          }
        },
        %ExOpenRTB.Imp{
          bidfloor: 2.0,
          id: "3",
          video: %ExOpenRTB.Video{
            api: [:vpaid_1, :vpaid_2],
            battr: [:user_interactive, :windows_dialog_or_alert_style],
            boxingallowed: true,
            delivery: [:progressive],
            h: 480,
            linearity: :linear,
            maxbitrate: 1500,
            maxduration: 60,
            mimes: [
              "video/x-flv",
              "video/mp4",
              "application/x-shockwave-flash",
              "application/javascript"
            ],
            minbitrate: 300,
            minduration: 30,
            playbackmethod: [:auto_play_sound_on],
            pos: :above_fold,
            protocols: [:vast_2, :vast_3],
            sequence: 3,
            startdelay: -2,
            w: 640
          }
        }
      ],
      site: %ExOpenRTB.Site{
        domain: "siteabcd.com",
        id: "1345135123",
        name: "Site ABCD",
        page: "http://siteabcd.com/page.htm",
        privacypolicy: true,
        publisher: %ExOpenRTB.Publisher{
          id: "pub12345",
          name: "Publisher A"
        },
        ref: "http://referringsite.com/referringpage.htm",
        cat: ["Auto Parts", "Auto Repair"],
        content: %ExOpenRTB.Content{
          cat: ["Auto Repair"],
          episode: 23,
          id: "1234567",
          season: "2",
          series: "All About Cars",
          title: "Car Show"
        }
      },
      user: %ExOpenRTB.User{
        buyeruid: "545678765467876567898765678987654",
        data: [
          %ExOpenRTB.Data{
            id: "6",
            name: "Data Provider 1",
            segment: [
              %ExOpenRTB.Segment{
                id: "12341318394918",
                name: "auto intenders"
              },
              %ExOpenRTB.Segment{
                id: "1234131839491234",
                name: "auto enthusiasts"
              }
            ]
          }
        ]
      }
    },
    :bidrequest,
    :"breq.video"
  )
end
