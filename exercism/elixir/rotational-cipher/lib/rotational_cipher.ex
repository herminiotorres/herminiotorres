defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @lowercase ?a..?z
  @uppercase ?A..?Z

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> Enum.map(fn char -> chipher(char, shift) end)
    |> List.to_string
  end

  defp chipher(char, shift) when char in @lowercase, do: transform(char, shift, @lowercase)

  defp chipher(char, shift) when char in @uppercase, do:  transform(char, shift, @uppercase)

  defp chipher(char, _), do: char

  defp transform(char, shift, first..last) do
    cond do
      char + shift > last ->
        (first - 1) + rem(char + shift, last)
      true -> char + shift
    end
  end
end
