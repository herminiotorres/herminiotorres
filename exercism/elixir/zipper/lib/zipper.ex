defmodule Zipper do
  defstruct [:current, :former]

  @type dir :: :left | :right
  @type t() :: %__MODULE__{current: BinTree.t(), former: [{dir, any, BinTree.t()}]}

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BinTree.t()) :: Zipper.t()
  def from_tree(bin_tree) do
    %__MODULE__{current: bin_tree, former: []}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Zipper.t()) :: BinTree.t()
  def to_tree(%__MODULE__{current: bin_tree, former: []}) do
    bin_tree
  end

  def to_tree(%__MODULE__{current: bin_tree, former: [{:left, value, right} | tail]}) do
    bin_tree = %BinTree{value: value, left: bin_tree, right: right}

    to_tree(%__MODULE__{current: bin_tree, former: tail})
  end

  def to_tree(%__MODULE__{current: bin_tree, former: [{:right, value, left} | tail]}) do
    bin_tree = %BinTree{value: value, left: left, right: bin_tree}

    to_tree(%__MODULE__{current: bin_tree, former: tail})
  end

  @doc """
  Get the value of the focus node.
  """
  @spec value(Zipper.t()) :: any
  def value(%__MODULE__{current: %BinTree{value: value}}) do
    value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Zipper.t()) :: Zipper.t() | nil
  def left(%__MODULE__{
        current: %BinTree{left: nil}
      }) do
    nil
  end

  def left(%__MODULE__{current: %BinTree{value: value, right: right, left: left}, former: former}) do
    %__MODULE__{
      current: left,
      former: [{:left, value, right} | former]
    }
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Zipper.t()) :: Zipper.t() | nil
  def right(%__MODULE__{
        current: %BinTree{right: nil}
      }) do
    nil
  end

  def right(%__MODULE__{current: %BinTree{value: value, right: right, left: left}, former: former}) do
    %__MODULE__{
      current: right,
      former: [{:right, value, left} | former]
    }
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Zipper.t()) :: Zipper.t() | nil
  def up(%__MODULE__{current: _bin_tree, former: []}) do
    nil
  end

  def up(%__MODULE__{current: bin_tree, former: [{:left, value, right} | tail]}) do
    bin_tree = %BinTree{value: value, left: bin_tree, right: right}

    %__MODULE__{current: bin_tree, former: tail}
  end

  def up(%__MODULE__{current: bin_tree, former: [{:right, value, left} | tail]}) do
    bin_tree = %BinTree{value: value, left: left, right: bin_tree}

    %__MODULE__{current: bin_tree, former: tail}
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Zipper.t(), any) :: Zipper.t()
  def set_value(%__MODULE__{current: bin_tree, former: former}, value) do
    bin_tree = Map.put(bin_tree, :value, value)

    %__MODULE__{current: bin_tree, former: former}
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_left(%__MODULE__{current: bin_tree, former: former}, left) do
    bin_tree = Map.put(bin_tree, :left, left)

    %__MODULE__{current: bin_tree, former: former}
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_right(%__MODULE__{current: bin_tree, former: former}, right) do
    bin_tree = Map.put(bin_tree, :right, right)

    %__MODULE__{current: bin_tree, former: former}
  end
end
