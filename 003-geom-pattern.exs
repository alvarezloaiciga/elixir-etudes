defmodule Geom do
  def area(:rectangle, length, width) do
    length * width
  end

  def area(:triangle, base, height) do
    base * height / 2.0
  end

  def area(:ellipse, major_radius, minor_radius) do
    :math.pi() * major_radius * minor_radius
  end
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case, async: true

  import Geom

  test "calculates area for rectangle" do
    assert Geom.area(:rectangle, 3, 4) == 12
  end

  test "calculates area for triangle" do
    assert Geom.area(:triangle, 3, 5) == 7.5
  end

  test "calculates area for ellipse" do
    assert Geom.area(:ellipse, 2, 4) == 25.132741228718345
  end
end
