defmodule ResistorColorTrio do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @kilo 1000
  @mega @kilo * 1000
  @giga @mega * 1000

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([color1, color2, color3 | _]) do
    d1 = value(color1) * 10
    d2 = value(color2)
    factor = 10 ** value(color3)

    case result = (d1 + d2) * factor do
      r when r >= @kilo and r < @mega -> {r / @kilo, :kiloohms}
      r when r >= @mega and r < @giga -> {r / @mega, :megaohms}
      r when r >= @mega -> {r / @giga, :gigaohms}
      _ -> {result, :ohms}
    end
  end

  @spec value(color :: atom()) :: integer()
  defp value(color) do
    Map.get(@colors, color)
  end
end
