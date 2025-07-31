defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize(''), do: ''

  def sanitize([h | t]) do
    sanitizied =
      case h do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        ?_ -> '_'
        char when char >= ?a and char <= ?z -> [char]
        _ -> ''
      end

    sanitizied ++ sanitize(t)
  end
end
