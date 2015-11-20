defmodule Powers do
  import Kernel, except: [raise: 2]

  def raise(_number, 0) do
    1
  end

  def raise(number, power) when power > 0 do
    number * raise(number, power-1)
  end

  def raise(number, power) when power < 0 do
    1.0 / raise(number, -power)
  end

end


ExUnit.start

defmodule PowersTest do
  use ExUnit.Case

  test "positive power of 0" do
    assert Powers.raise(5,0) == 1
  end

  test "positive power of 1" do
    assert Powers.raise(5,1) == 5
  end

  test "positive power of 3" do
    assert Powers.raise(2,3) == 8
  end

  test "negative power of 3" do
    assert Powers.raise(2,-3) == 0.125
  end
end
