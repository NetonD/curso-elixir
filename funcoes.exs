# 1) função anonima padrão
fn_anonima = fn (a,b) -> a + b end

# OU sem parenteses

fn_anonima2 = fn a, b -> a+b end

# 2) Com mais de uma linha

fn_anonima3 = fn a, b ->
    variavel = a+b
    variavel/2
end

# 3) Mais de uma instrução na mesma linha

fn_anonima4 = fn a, b -> variavel = a+b; variavel/2 end

# 4) Diminuindo sintaxe função anonima com operator Capture
#Essa função e igual a função fn_anonima1 e fn_anonima2
fn_capture = &(&1 + &2)

#Ou ainda podemos omitir os parenteses
fn_capture2 = & &1 + &2

# 5) Encapsulando uma função dentro de outra
upcase = fn string -> String.upcase(string) end

# 6) Encapsulando com capture
upcase2 = &String.upcase/1

## ## ## ## ## ## ## ## ## ##
#Chamando uma função anonima
IO.puts(fn_anonima.(2,3)) #5
IO.puts(fn_anonima2.(2,3))#5
IO.puts(fn_anonima3.(2,3)) #2.5
IO.puts(fn_anonima4.(2,3)) #2.5
IO.puts(fn_capture.(2,3))
IO.puts(fn_capture2.(2,3))
IO.puts(upcase.("almir"))
IO.puts(upcase2.("NETO"))