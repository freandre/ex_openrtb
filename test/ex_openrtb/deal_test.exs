defmodule ExOpenRTB.DealTest do
  use ExUnit.Case, async: true
  import ExOpenRTB.Test

  test_decode(
    %ExOpenRTB.Deal{
      id: "DX-1985-010A",
      bidfloor: 2.5,
      at: :second_price
    },
    :deal
  )
end
