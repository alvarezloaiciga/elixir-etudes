defmodule Geom do
  def area({shape, number1, number2}) do
    area(shape, number1, number2)
  end

  defp area(:rectangle, length, width) when length > 0 and width > 0 do
    length * width
  end

  defp area(:triangle, base, height) when base > 0 and height > 0 do
    base * height / 2.0
  end

  defp area(:ellipse, major_radius, minor_radius) when major_radius > 0 and minor_radius > 0 do
    :math.pi() * major_radius * minor_radius
  end

  defp area(_, _, _) do
    0
  end
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case

  test "calcs area for rectangle" do
    assert Geom.area({:rectangle, 7, 3}) == 21
  end

  test "calcs area for triangle" do
    assert Geom.area({:triangle, 7, 3}) == 10.5
  end

  test "calcs area for ellipse" do
    assert Geom.area({:ellipse, 7, 3}) == 65.97344572538566
  end

  test "returns 0 when shape is unknown" do
    assert Geom.area({:pentagon, 7, 3}) == 0
  end

  test "raises exception when calling the function with 3 params instead of a tuple" do
    assert_raise UndefinedFunctionError, fn ->
      Geom.area(:rectangle, 7, 3)
    end
  end
end
