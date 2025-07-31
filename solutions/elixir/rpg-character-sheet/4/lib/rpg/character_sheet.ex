defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    ask("What is your character's name?")
  end

  def ask_class() do
    ask("What is your character's class?")
  end

  def ask_level() do
    {level, _} = ask("What is your character's level?") |> Integer.parse()
    level
  end

  def run() do
    char =
      with _ <- welcome(),
           name <- ask_name(),
           class <- ask_class(),
           level <- ask_level(),
           do: %{name: name, class: class, level: level}

    IO.inspect(char, label: "\nYour character")
    char
  end

  defp ask(message) do
    IO.gets("#{message}\n") |> String.trim()
  end
end
