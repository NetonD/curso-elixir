defmodule Math do
    def sum_to(1) do
        1
    end

    def sum_to(n) when n > 0 and is_integer(n), do: n+sum_to(n-1)
end


Math.sum_to(10) |> IO.puts
Math.sum_to(2) |> IO.puts