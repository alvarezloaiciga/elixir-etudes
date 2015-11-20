defmodule Geom do
  def area(:rectangle, length, width) when length > 0 and width > 0 do
    length * width
  end

  def area(:triangle, base, height) when base > 0 and height > 0 do
    base * height / 2.0
  end

  def area(:ellipse, major_radius, minor_radius) when major_radius > 0 and minor_radius > 0 do
    :math.pi() * major_radius * minor_radius
  end

  def area(_, _, _) do
    0
  end
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case, async: true

  test "calculates area for rectangle" do
    assert Geom.area(:rectangle, 3, 4) == 12
  end

  test "calculates area for triangle" do
    assert Geom.area(:triangle, 3, 5) == 7.5
  end

  test "calculates area for ellipse" do
    assert Geom.area(:ellipse, 2, 4) == 25.132741228718345
  end

  test "returns 0 when negative attributes are passed for rectangle" do
    assert Geom.area(:rectangle, -3, 4) == 0
    assert Geom.area(:rectangle, 3, -4) == 0
  end

  test "returns 0 when negative attributes are passed for triangle" do
    assert Geom.area(:triangle, -3, 4) == 0
    assert Geom.area(:triangle, 3, -4) == 0
  end

  test "returns 0 when negative attributes are passed for ellipse" do
    assert Geom.area(:ellipse, -3, 4) == 0
    assert Geom.area(:ellipse, 3, -4) == 0
  end

  test "returns 0 when unkown shape is passed as attribute" do
    assert Geom.area(:weird_shape, 2, 4) == 0
    assert Geom.area(:box, 2, 4) == 0
  end
end
