defmodule RationalNumbers do
  @type rational :: {integer, integer}
  
  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {(a1 * b2) + (a2 * b1), b1 * b2}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {(a1 * b2) - (a2 * b1), b1 * b2}
    |> reduce()
  end
  
  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, a2 * b1}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)}
    |> reduce()
  end

  def pow_rational({a, b}, n) when n < 0 do
    {b ** (-n), a ** (-n)}
    |> reduce()
  end
  def pow_rational({a, b}, n) do
    {a ** n, b ** n}
    |> reduce()
  end

  def pow_real(x, {a, b}) do
    x ** (a/b)
  end

  def reduce({a, b}) when b < 0 do
    reduce({-a, -b})
  end

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    {(a / gcd), (b / gcd)}
  end
end