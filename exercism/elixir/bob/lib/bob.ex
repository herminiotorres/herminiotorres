defmodule Bob do
  def hey(unstripped_input) do
    input = String.trim(unstripped_input)

    cond do
      silence?(input) ->
        "Fine. Be that way!"

      shouting?(input) and question?(input) ->
        "Calm down, I know what I'm doing!"

      shouting?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  def shouting?(input) do
    (String.upcase(input) == input) and (String.downcase(input) != input)
  end

  def question?(input) do
    String.ends_with?(input, "?")
  end

  def silence?(input) do
    String.trim(input) == ""
  end
end
