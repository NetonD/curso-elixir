variavel_imutavel = 157

defmodule Mutante do
    def mutar(variavel) do
        variavel = 0
        IO.puts("Dentro do escopo mutar: #{variavel}")
        variavel
    end
end

Mutante.mutar(variavel_imutavel)

IO.puts("Escopo fora da funçao sem mexer: #{variavel_imutavel}")

variavel_imutavel = Mutante.mutar(variavel_imutavel)
IO.puts("Escopo fora da funçao depois de mexer: #{variavel_imutavel}")


