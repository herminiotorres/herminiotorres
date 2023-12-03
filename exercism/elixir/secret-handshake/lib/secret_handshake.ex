defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> to_binary
    |> to_integer
    |> build_secret
  end

  defp to_binary(code, base \\ 2), do: Integer.to_string(code, base)

  defp to_integer(code), do: String.to_integer(code)

  defp build_secret(code), do: build_secret(code, [], false)

  defp build_secret(0, acc, true), do: acc |> Enum.reverse
  defp build_secret(0, acc, false), do: acc
  defp build_secret(code, acc, reverse) do
    cond do
      code >= 10000 ->
        build_secret((code - 10000), acc, true)

      code >= 1000 ->
        build_secret((code - 1000), ["jump" | acc], reverse)

      code >= 100 ->
        build_secret((code - 100), ["close your eyes" | acc], reverse)

      code >= 10 ->
        build_secret((code - 10), ["double blink" | acc], reverse)

      code >= 1 ->
        build_secret((code - 1), ["wink" | acc], reverse)

      true -> build_secret(code, acc, reverse)
    end
  end
end
