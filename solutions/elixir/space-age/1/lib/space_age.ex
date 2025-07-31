defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    age_on_earth = seconds / 31_557_600

    case planet do
      :mercury -> {:ok, age_on_earth / 0.2408467}
      :venus -> {:ok, age_on_earth / 0.61519726}
      :earth -> {:ok, age_on_earth / 1}
      :mars -> {:ok, age_on_earth / 1.8808158}
      :jupiter -> {:ok, age_on_earth / 11.862615}
      :saturn -> {:ok, age_on_earth / 29.447498}
      :uranus -> {:ok, age_on_earth / 84.016846}
      :neptune -> {:ok, age_on_earth / 164.79132}
      _ -> {:error, "not a planet"}
    end
  end
end
