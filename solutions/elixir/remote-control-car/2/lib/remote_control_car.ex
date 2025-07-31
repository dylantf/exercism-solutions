defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(car) when is_struct(car, RemoteControlCar) do
    "#{car.distance_driven_in_meters} meters"
  end

  def display_battery(car) when is_struct(car, RemoteControlCar) do
    if car.battery_percentage == 0 do
      "Battery empty"
    else
      "Battery at #{car.battery_percentage}%"
    end
  end

  def drive(car) when is_struct(car, RemoteControlCar) do
    if car.battery_percentage < 1 do
      car
    else
      %RemoteControlCar{
        car
        | distance_driven_in_meters: car.distance_driven_in_meters + 20,
          battery_percentage: car.battery_percentage - 1
      }
    end
  end
end
