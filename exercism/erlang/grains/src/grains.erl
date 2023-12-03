-module(grains).

-export([square/1, total/0]).

square(Square) when Square < 1 orelse Square > 64 -> {error, "square must be between 1 and 64"};
square(1) -> 1;
square(Square) -> 2 * square(Square-1).

total() -> (2 * square(64))-1.
