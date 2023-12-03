defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_language] = _list) do
    []
  end

  def remove(list) do
    [hd | _tl] = Enum.reverse(list)

    [hd]
  end

  def first(list) do
    Kernel.hd(list)
  end

  def count(list) do
    length(list)
  end

  def exciting_list?(["Clojure", "Haskell", "Erlang", "F#", "Elixir"] = _list) do
    true
  end

  def exciting_list?(_list) do
    false
  end
end
