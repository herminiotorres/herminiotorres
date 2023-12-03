defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @alphabet ?a..?z

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    chartlist_sentence =
      sentence
      |> String.downcase
      |> to_charlist

    Enum.all?(@alphabet, & &1 in chartlist_sentence)
  end
end
