defmodule WordCount do
  @doc """
    Character classe:
    alnum - Letters and digits.

    Modifiers:
      unicode (u) - enables Unicode specific patterns like \p and
      change modifiers like \w, \W, \s and friends to also match on Unicode.
      It expects valid Unicode strings to be given on match.

      caseless (i) - adds case insensitivity.

      extended (x) - whitespace characters are ignored except when escaped and
      allow # to delimit comments.
  """
  @pattern ~r/[^[:alnum:]-]/xiu

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> split
    |> counter
  end

  defp split(sentence) do
    sentence
    |> String.split(@pattern, trim: true)
  end

  defp counter(sentence) do
    sentence
    |> Enum.frequencies_by(&String.downcase/1)
  end
end
