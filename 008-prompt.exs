defmodule Geom do
  def calculate(shape, number1, number2) do
    case shape do
      :rectangle -> number1 * number2
      :triangle -> number1 * number2 / 2.0
      :ellipse -> :math.pi() * number1 * number2
    end
  end
end

defmodule AskArea do
  def area do
    shape = IO.gets("R)ectangle, T)riangle, or E)llipse: ") |> String.strip
    shape_atom = char_to_shape(shape)

    case get_dimensions(shape_atom) do
      { :error, :unknown_shape } -> IO.puts "Unknown shape " <> shape
      { dim1, dim2 } when dim1 >= 0 and dim2 >= 0 -> IO.puts Geom.calculate(shape_atom, dim1, dim2)
      _ -> IO.puts "Both numbers must be greater than or equal to zero."
    end
  end

  defp char_to_shape(char) do
    shape_initial = char
      |> String.first
      |> String.upcase

    case shape_initial do
      "T" -> :triangle
      "R" -> :rectangle
      "E" -> :ellipse
      _ -> :unknown
    end
  end

  defp get_dimensions(shape) do
    case shape do
      :triangle -> { get_number("base"), get_number("heigth") }
      :rectangle -> { get_number("width"), get_number("heigth") }
      :ellipse -> { get_number("major radius"), get_number("minor radius") }
      :unknown -> { :error, :unknown_shape }
    end
  end

  defp get_number(prompt_message) do
    entered_number = IO.gets "Enter " <> prompt_message <> ": "
    { number, _ } = entered_number
      |> String.strip
      |> Integer.parse
    number
  end
end
