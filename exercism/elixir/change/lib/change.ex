defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(_coins, 0), do: {:ok, []}

  def generate(coins, target) do
    coins = Enum.sort(coins, &>/2)

    coins
    |> Enum.map(&do_matrix(&1, target, coins))
    |> Enum.filter(&(Enum.sum(&1) == target))
    |> result()
  end

  def do_matrix(coin, target, coins) do
    coins
    |> Enum.filter(&(&1 <= coin and &1 <= target))
    |> change(target, [])
  end

  def change([h | t] = coins, target, acc) when target - h >= 0 do
    cond do
      target - h < List.last(coins) && target - h > 0 -> change(t, target, acc)
      true -> change(coins, target - h, [h | acc])
    end
  end

  def change([_h | t], target, acc) do
    change(t, target, acc)
  end

  def change([], _target, acc), do: acc

  def result([]), do: {:error, "cannot change"}
  def result(results), do: {:ok, Enum.min_by(results, &length/1)}
end
