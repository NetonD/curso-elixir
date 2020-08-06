variavel = "Almir Neto"

# O resultado da função da esquerda é passado
# como argumento para função da direita.
String.length(variavel) |> IO.puts

# 1) Pode-se encadear os pipes

"Almir"|> String.length |> IO.puts

# 2) Ou quebrar linha para ficar mais legivel
"Almir"
|> String.length
|> IO.puts

