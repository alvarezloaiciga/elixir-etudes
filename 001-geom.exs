defmodule Geom do
  def area(x \\ 1, y \\ 1) do
    x * y
  end
end

ExUnit.start

defmodule GeomTest do
  # 3) Notice we pass `async: true`, this runs the test case
  #    concurrently with other test cases
  use ExUnit.Case, async: true

  import Geom, only: [area: 2]

  test "area with height and width" do
    assert Geom.area(3, 4) == 12
    assert Geom.area(12, 7) == 84
  end

  test "area with only heigth" do
    assert Geom.area(12) == 12
  end

  test "area with no params" do
    assert Geom.area() == 1
  end
end
