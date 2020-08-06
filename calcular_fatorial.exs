defmodule Fatorial do
    def of(0), do: 1
    def of(n) when n > 0, do: n*of(n-1)
end


Fatorial.of(10) |> IO.puts
Fatorial.of(1000) |> IO.puts
