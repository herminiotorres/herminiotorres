defmodule GuessingGame do
  def compare(_secret_number) do
    "Make a guess"
  end

  def compare(secret_number, guess) when is_integer(guess) do
    cond do
      secret_number - guess == 1 or secret_number - guess == -1 -> "So close"
      secret_number < guess -> "Too high"
      secret_number > guess -> "Too low"
      true -> "Correct"
    end
  end

  def compare(_secret_number, _guess) do
    "Make a guess"
  end
end
