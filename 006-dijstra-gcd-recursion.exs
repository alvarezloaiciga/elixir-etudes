defmodule Dijkstra do
  def gcd(m, n) when m == n do
    m
  end

  def gcd(m, n) when m < n do
    gcd(m, n-m)
  end

  def gcd(m, n) do
    gcd(m-n, n)
  end

end


ExUnit.start

defmodule DijkstraTest do
  use ExUnit.Case

  test "returns any of the numbers when equal numbers" do
    assert Dijkstra.gcd(8, 8) == 8
    assert Dijkstra.gcd(10, 10) == 10
  end

  test "returns correct when numbers are not equal" do
    assert Dijkstra.gcd(2, 8) == 2
    assert Dijkstra.gcd(14, 21) == 7
    assert Dijkstra.gcd(120, 36) == 12
  end

  test "when numbers don't have a GCD" do
    assert Dijkstra.gcd(125, 46) == 1
    assert Dijkstra.gcd(5, 7) == 1
  end
end
