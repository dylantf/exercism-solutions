defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, dt, _} = DateTime.from_iso8601(string)
    DateTime.to_naive(dt)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days =
      if before_noon?(checkout_datetime) do
        28
      else
        29
      end

    NaiveDateTime.to_date(checkout_datetime) |> Date.add(days)
  end

  @spec days_late(Date.t(), NaiveDateTime.t()) :: integer()
  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)

    if Date.compare(actual_return_date, planned_return_date) == :gt do
      Date.diff(actual_return_datetime, planned_return_date)
    else
      0
    end
  end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = datetime_from_string(checkout) |> return_date()
    actual_return_datetime = datetime_from_string(return)
    days = days_late(planned_return_date, actual_return_datetime)

    if monday?(actual_return_datetime) do
      (rate * days) |> div(2)
    else
      rate * days
    end
  end
end
