defmodule HighScore do
  @default_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @default_score) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.reject(scores, fn {key, _val} -> key == name end)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @default_score)
  end

  def update_score(scores, name, score \\ @default_score) do
    Map.update(scores, name, score, fn prev -> prev + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
