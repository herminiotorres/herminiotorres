defmodule Frequency do
  @pattern ~r/[^[:alpha:]]/xiu

  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Enum.reduce("", &(&1 <> &2))
    |> String.replace(@pattern, "")
    |> split_text(workers)
    |> Stream.map(&Task.async(fn -> count_letter(&1) end))
    |> Stream.map(&Task.await/1)
    |> Enum.reduce(%{}, &Map.merge(&1, &2, fn _k, v1, v2 -> v1 + v2 end))
  end

  defp split_text("", _workers), do: [[]]
  defp split_text(text, 1), do: [String.codepoints(text)]
  defp split_text(text, workers) do
    text
    |> String.codepoints()
    |> Enum.chunk_every(ceil(String.length(text) / workers))
  end

  defp count_letter([]), do: %{}
  defp count_letter(characters),
    do: characters |> Stream.map(&String.downcase/1) |> Enum.frequencies()
end
