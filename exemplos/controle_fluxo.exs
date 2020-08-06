#Utilizando notação curta para definição das funções

defmodule ComparaNumero do
    def maior(n1,n2), do: check(n1 >= n2, n1, n2)

    defp check(true,n1,_), do: n1
    defp check(false,_, n2), do: n2
end


ComparaNumero.maior(9,10) |> IO.puts
ComparaNumero.maior(11,3) |> IO.puts
ComparaNumero.maior(8,8) |> IO.puts