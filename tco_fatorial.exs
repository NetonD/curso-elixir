# Tail Call Optimization
# Pro: É usada para reduzir o gasto de memória nas funções recursivas
# Contra: dificil legibilidade
defmodule TCOFatorial do
    def of(n) do
        tco_fatorial(n,1)
    end

    def tco_fatorial(0, acc), do: acc
    def tco_fatorial(n, acc) when n > 0, do: tco_fatorial(n-1, n*acc)
end


TCOFatorial.of(5) |> IO.puts

"""
n  ,  acc

5      1   => [acc=5,  n=4]
4      20  => [acc=20, n=3]
3      60  => [acc=60, n=2]
2      120 => [acc=120,n=1]
1      120 => [acc=120,n=0]
0 => 120(acc)

"""