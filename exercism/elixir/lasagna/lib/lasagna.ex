defmodule Lasagna do
  @spec expected_minutes_in_oven() :: integer()
  def expected_minutes_in_oven, do: 40

  @spec remaining_minutes_in_oven(integer()) :: integer()
  def remaining_minutes_in_oven(taken_minutes_in_oven) do
    expected_minutes_in_oven()
    |> Kernel.-(taken_minutes_in_oven)
    |> Kernel.abs()
  end

  @spec preparation_time_in_minutes(integer()) :: integer()
  def preparation_time_in_minutes(number_of_layers) do
    minutes_per_layer = 2

    number_of_layers
    |> Kernel.*(minutes_per_layer)
  end

  @spec total_time_in_minutes(integer(), integer()) :: integer()
  def total_time_in_minutes(number_of_layers, taken_minutes_in_oven) do
    number_of_layers
    |> preparation_time_in_minutes()
    |> Kernel.+(taken_minutes_in_oven)
  end

  @spec alarm() :: String.t()
  def alarm, do: "Ding!"
end
