ExUnit.start()

defmodule ExOpenRTB.Test do
  defmacro test_decode(structure, decoder) do
    quote do
      test_decode(unquote(structure), unquote(decoder), unquote(decoder))
    end
  end

  defmacro test_decode(structure, decoder, filename) do
    path = 'test/fixtures/#{filename}.json'

    quote do
      test unquote("#{filename} is correctly destructured") do
        json = File.read!(unquote(path))
        assert unquote(structure) == ExOpenRTB.Decoder.decode!(unquote(decoder), json)
      end
    end
  end
end
