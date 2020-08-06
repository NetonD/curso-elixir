#Desconstruindo uma lista e uma tupla
{a,b,d} = {:ok,20.5,"ola"}

[x,y,z] = [:ok,20.5,"ola"]

IO.puts(a)
IO.puts(b)
IO.puts(d)

#Pattern match em uma lista para pegar
# cabeça e cauda dela. 
lista = [1,2,3,4,5]

[cabeca | cauda] = lista
IO.puts(cabeca )
IO.puts(cauda)


#Pattern Match em uma string
"Almir " <> sobrenome = "Almir Alves da Silva Neto"
IO.puts(sobrenome)

#Usando pin operator para evitar rebind

[k,l] = [1,2]
[^k,l] = [2,3] #gera um erro de match não correspondido
