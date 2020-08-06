# Elixir

## Divisão de um programa em elixir

Um programa elixir comum é dividido em módulos e funções. Essas funções são agrupadas por "afinidade" em um módulo para que possam ser reutilizadas depois. 

## Aridade de função

A aridade de uma função nada mais é que o número de parâmetros que a função recebe. Em um exemplo da função `IO.puts()` a aridade é um, pois, para a ela precisamos passar somente a `string` que queremos mostrar. A notação da aridade de uma função é essa: `IO.puts/1` indicando que `IO.puts` recebe um argumento.

## Funções built in Elixir

Como no Python por exemplo o elixir possui um conjunto de funções que são carregadas automáticamente para qualquer programa. Essas funções são encontradas no modulo `Kernel`, que é um modulo do ambiente padrão do elixir. As funções contidas nesse módulo não necessitam que o prefixo do módulo, i.e `Kernel.func()`, sejam usadas explicitamente.

## Tipos primitivos Elixir

- Integer: valores inteiros positivos e negativos.
- Float: valores de números reais que possuem casas decimais.
- Boolean: valores binários que podem ser `true` ou `false`
- String: cadeia de caracteres que formam palavras
- List: conjunto de valores delimitados por `[ ]`
- Tuple: conjunto de valores delimitados por `{ }`
- Atoms: são variáveis que o valor dela é seu nome por exemplo`:ok`

### Integers propriedades interessantes

Um número inteiro pode ser representado em bases diferentes da decimal como binário, hexadecimal e octal. Qualquer uma dessas representações vai nos resultar em um valor do tipo inteiro, por exemplo abaixo tem o número `10` representado nas quatro bases:

```
n_10dec = 10
n_10hex = 0xA
n_10oct = 0xo12
n_10bin = 0b1010
```

### Float funções interessantes

Além das operações básicas como multiplicação, divisão, soma, subtração e resto de divisão o Elixir fornece um conjunto de funções para tratar números reais. As operações básicas são realizadas utilizando operadores semelhantes a linguagens `C like`. As funções abaixo estão contidas no módulo `Kernel`.

```elixir
round(numero, precisão) # Arredonda um número real para quantidade de casas definida em precisão
ceil(numero)  # Aproxima o valor para o maior inteiro.
floor(numero) # Aproxima o valor para o menor número inteiro
...
```

> Existem mais funções que podem ser encontradas na documentação

### Strings curiosidades

Como na maioria das linguagens de alto nível Elixir fornece formas de formatar variáveis em strings. Além disso as strings no Elixir são armazenadas no padrão `UTF-8` e cada caractere exceto os especiais utilizam 1 byte de memória e 2 bytes para os especiais como `ã, é, õ ...`.

```elixir
minha_string = "Jose"
IO.puts("Olá #{minha_string}) # Olá Jose
byte_size(minha_string)       # 4 bytes
byte_size("José")             # 5 bytes
outra_string = "José" <> "Silva" #outra_string = "JoséSilva"
String.length(minha_string)   # 4 elementos
```

Para obter a representação binária da string basta concatenar a string com o `<<0>>`.

```elixir
"Neto" <> <<0>> #<<78, 101, 116, 111, 0>>
```

## [Keyword lists e Maps](keywordlists_e_maps.exs)

Esses dois tipo de conjuntos permitem que usemos chaves para encontrar os elementos inseridos nelas. Uma `Keyword List` só permite que nossas chaves sejam do tipo `Atom` além de não ser indexada e cada elemento nela é um `Tuple` na forma de `Atom : Valor`. Já as `Maps` são mais flexíveis quanto ao tipo da chave podendo utilizar qualquer um dos tipos como chave.

```elixir
minha_kwl = [{:chave1, "Valor1"},{:chave2, 123}]
minha_map = ["chave1"=>123, 7=>[:ok,:bad], [1,2,3]=>"Lista"]
```

## [Cláusula de guarda](clausula_guarda.exs)

Como o paradigma de programação funcional recorre muitas vezes à recursão, então para que não ocorra de realizar uma chamada recursiva infinita utiliza-se cláusulas que verificam se o estado da variável é válido para continuar com a execução. Ela se encontra logo antes da expressão `do` e pode receber uma serie de verificações booleanas.

```elixir
def func(n) when expressão_booleana_sobre_n, do ...
```
