defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name, score \\ 0) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.reject(scores, fn {key, _val} -> key == name end)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, 0)
  end

  def update_score(scores, name, score \\ 0) do
    Map.update(scores, name, score, fn prev -> prev + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
