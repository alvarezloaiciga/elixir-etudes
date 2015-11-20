defmodule Geom do
  def area(shape, number1, number2) when number1 > 0 and number2 > 0 do
    case shape do
      :rectangle -> number1 * number2
      :triangle -> number1 * number2 / 2.0
      :ellipse -> :math.pi() * number1 * number2
      _ -> 0
    end
  end
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case

  test "calcs area for rectangle" do
    assert Geom.area(:rectangle, 7, 3) == 21
  end

  test "calcs area for triangle" do
    assert Geom.area(:triangle, 7, 3) == 10.5
  end

  test "calcs area for ellipse" do
    assert Geom.area(:ellipse, 7, 3) == 65.97344572538566
  end

  test "returns 0 when shape is unknown" do
    assert Geom.area(:pentagon, 7, 3) == 0
  end

  test "raises exception when calling the function with negative numbers" do
    assert_raise FunctionClauseError, fn ->
      Geom.area(:rectangle, -7, 3)
    end

    assert_raise FunctionClauseError, fn ->
      Geom.area(:rectangle, 7, -3)
    end
  end
end
