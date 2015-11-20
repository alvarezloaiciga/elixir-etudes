defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.

  from *Études for Elixir*, O'Reilly Media, Inc., 2013.
  Copyright 2015 by Jose Alvarez.
  """
  @vsn 0.1

  @doc """
  Calculates the area of a rectangle, given the length and width.
  Returns the product of its arguments. The default value for
  both arguments is 1.
  """

  @spec area(number(), number()) :: number()

  def area(length \\ 1, width \\ 1) do
    length * width
  end
end

ExUnit.start

defmodule GeomTest do
  # 3) Notice we pass `async: true`, this runs the test case
  #    concurrently with other test cases
  use ExUnit.Case, async: true

  import Geom, only: [area: 2]

  test "area with length and width" do
    assert Geom.area(3, 4) == 12
    assert Geom.area(12, 7) == 84
  end

  test "area with only length" do
    assert Geom.area(12) == 12
  end

  test "area with no params" do
    assert Geom.area() == 1
  end
end
