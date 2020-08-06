# Criando uma Keyworkd list
minha_kwl = [{:chave1, "Valor1"},{:chave2, 123}]

#Criando um Map
minha_map = %{"chave1"=>123, 7=>[:ok,:bad], [1,2,3]=>"Lista"}


#Acessando chave1 Keyword List
minha_kwl[:chave1] |> IO.puts
minha_kwl[:chave2] |> IO.puts

#Acessando os valores do Map
minha_map[:chave1] |> IO.puts
minha_map[[1,2,3]] |> IO.puts