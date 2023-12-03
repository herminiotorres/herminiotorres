defmodule LogLevel do
  def to_label(0, false) do
    :trace
  end

  def to_label(0, _legacy?) do
    :unknown
  end

  def to_label(level, _legacy?) when level in [1, 2, 3, 4] do
    case level do
      1 -> :debug
      2 -> :info
      3 -> :warning
      4 -> :error
    end
  end

  def to_label(5, false) do
    :fatal
  end

  def to_label(_level, _legacy?) do
    :unknown
  end

  def alert_recipient(level, true) when level <= 0 or 5 <= level do
    :dev1
  end

  def alert_recipient(level, false) when level < 0 or 5 < level do
    :dev2
  end

  def alert_recipient(level, _legacy?) when level == 4 or level == 5 do
    :ops
  end

  def alert_recipient(_level, _legacy?) do
  end
end
