defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    cond do
      bigest_than_one_word?(phrase) ->
        phrase
        |> String.split
        |> Enum.map(&PigLatin.translate/1)
        |> Enum.join(" ")

      beginning_with_y_or_x_followed_by_consonant?(phrase) ->
        phrase
        |> String.replace_suffix("", "ay")

      beginning_consonant?(phrase) ->
        phrase
        |> String.codepoints
        |> flip_consonant_letters_to_end([])
        |> List.flatten
        |> Enum.join
        |> String.replace_suffix("", "ay")

      true ->
        phrase
        |> String.replace_suffix("", "ay")
    end
  end

  defp bigest_than_one_word?(phrase), do: phrase |> String.split |> Enum.count > 1

  defp beginning_consonant?(phrase), do: Regex.match?(~r/^[^aeiou]+/i, phrase)

  defp beginning_consonant_with_qu?(character, phrase), do: character == "u" and Enum.member?(phrase, "q")

  defp beginning_with_y_or_x_followed_by_consonant?(<<first_letter::binary-size(1), rest_word::binary>>) do
    Enum.member?(["x", "y"], first_letter) and beginning_consonant?(rest_word)
  end

  defp flip_consonant_letters_to_end([], flip_phrase), do: flip_phrase
  defp flip_consonant_letters_to_end([character | rest_phrase], flip_phrase) do
    cond do
      beginning_consonant_with_qu?(character, flip_phrase) ->
        flip_consonant_letters_to_end(rest_phrase, [character | flip_phrase])

      beginning_consonant?(character) ->
        flip_consonant_letters_to_end(rest_phrase, [character | flip_phrase])

      true ->
        reverse_phrase = Enum.reverse(flip_phrase)
        flip_consonant_letters_to_end([], [character | [rest_phrase | reverse_phrase]])
    end
  end
end
