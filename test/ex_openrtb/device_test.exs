defmodule ExOpenRTB.DeviceTest do
  use ExUnit.Case, async: true
  import ExOpenRTB.Test

  test_decode %ExOpenRTB.Device{
    "dnt": false,
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3",
    "ip": "123.145.167.189",
    "geo": %ExOpenRTB.Geo{
      "country": "USA",
      "lat": 35.012345,
      "lon": -115.12345,
      "city": "Los Angeles",
      "metro": "803",
      "region": "CA",
      "zip": "90049"
    },
    "dpidsha1": "AA000DFE74168477C70D291f574D344790E0BB11",
    "dpidmd5": "AA003EABFB29E6F759F3BDAB34E50BB11",
    "carrier": "310-410",
    "language": "en",
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "6.1",
    "js": true,
    "connectiontype": :cellular,
    "devicetype": :mobile,
  }, :device
end
