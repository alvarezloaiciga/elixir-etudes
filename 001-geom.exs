defmodule Geom do
  def area(x, y) do
    x * y
  end
end

ExUnit.start

defmodule GeomTest do
  # 3) Notice we pass `async: true`, this runs the test case
  #    concurrently with other test cases
  use ExUnit.Case, async: true

  import Geom, only: [area: 2]

  test "area" do
    assert Geom.area(3, 4) == 12
    assert Geom.area(12, 7) == 84
  end
end
