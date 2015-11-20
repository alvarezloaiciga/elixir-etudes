defmodule DefaultValues do
  def sum(a \\ 3, b, c \\ 7) do
    a + b + c
  end
end


ExUnit.start

defmodule DefaultValuesTest do
  use ExUnit.Case, async: true

  import DefaultValues, only: [sum: 3]

  test "calling function without defaults" do
    assert DefaultValues.sum(11, 22, 33) == 66
  end

  test "assigns only first two args" do
    assert DefaultValues.sum(11, 22) == 40
  end

  test "assigns passed value to second arg" do
    assert DefaultValues.sum(22) == 32
  end
end
