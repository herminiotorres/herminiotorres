defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    proteins = rna
               |> String.codepoints
               |> Enum.chunk_every(3)
               |> Enum.map(& Enum.join/1)
               |> Enum.map(& String.to_atom/1)
               |> Enum.map(& get_protein[&1])
               |> Enum.uniq
               |> filter([])
               |> Enum.reverse

    case proteins do
      [nil] ->
        {:error, "invalid RNA"}

      _ ->
        {:ok, proteins}
    end
  end

  defp filter([], nil), do: [nil]
  defp filter([], acc), do: acc
  defp filter([head | tail], acc) do
    case head do
      nil ->
        filter([], nil)

      "STOP" ->
        filter([], acc)

      _ ->
        filter(tail, [head | acc])
    end
  end



  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    protein = get_protein[String.to_atom(codon)]

    case protein do
      nil ->
        {:error, "invalid codon"}

      _ -> {:ok, protein}
    end
  end

  defp get_protein do
    [
      UGU: "Cysteine",
      UGC: "Cysteine",
      UUA: "Leucine",
      UUG: "Leucine",
      AUG: "Methionine",
      UUU: "Phenylalanine",
      UUC: "Phenylalanine",
      UCU: "Serine",
      UCC: "Serine",
      UCA: "Serine",
      UCG: "Serine",
      UGG: "Tryptophan",
      UAU: "Tyrosine",
      UAC: "Tyrosine",
      UAA: "STOP",
      UAG: "STOP",
      UGA: "STOP"
    ]
  end
end
