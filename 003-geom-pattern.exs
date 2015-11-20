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

  test "it does not accept negative numbers for rectangle" do
    assert_raise FunctionClauseError, fn ->
      Geom.area(:rectangle, -3, 4)
    end

    assert_raise FunctionClauseError, fn ->
      Geom.area(:rectangle, 3, -4)
    end
  end

  test "it does not accept negative numbers for triangle" do
    assert_raise FunctionClauseError, fn ->
      Geom.area(:triangle, -3, 4)
    end

    assert_raise FunctionClauseError, fn ->
      Geom.area(:triangle, 3, -4)
    end
  end

  test "it does not accept negative numbers for ellipse" do
    assert_raise FunctionClauseError, fn ->
      Geom.area(:ellipse, -3, 4)
    end

    assert_raise FunctionClauseError, fn ->
      Geom.area(:ellipse, 3, -4)
    end
  end
end
