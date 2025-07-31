defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    @spec eat(t, %Character{}) :: {byproduct :: any(), %Character{}}
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    @spec eat(%RPG.LoafOfBread{}, %RPG.Character{}) :: {nil, %RPG.Character{}}
    def eat(_item, character) do
      {nil, %Character{character | health: character.health + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    @spec eat(%ManaPotion{}, %Character{}) :: {%EmptyBottle{}, %Character{}}
    def eat(potion, character) do
      {%EmptyBottle{}, %Character{character | mana: character.mana + potion.strength}}
    end
  end

  defimpl Edible, for: Poison do
    @spec eat(%Poison{}, %Character{}) :: {%EmptyBottle{}, %Character{}}
    def eat(_poison, character) do
      {%EmptyBottle{}, %Character{character | health: 0}}
    end
  end
end
