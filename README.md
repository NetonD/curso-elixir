# Programação funcional

## Princípios comuns

- First class function
- Pure functions
- Immutable variables
- Recursion
- Non-strict evaluation
- Statements
- Pattern matching

## [First class function](funcoes.exs)

__*First class function*__, também é conhecida pelos nomes de *Higher Order Functions*, __*First Class Citizens*__ são funções com a capacidade ou funcionalidade de receber como parâmetros outras funções e/ou poder em seus retornos poderem devolver uma função como resultado.

> Função lambda (anônima): é uma função que não possui nome e pode ser atribuída a uma variável ou passada como argumento para uma __*First Class Function*__

## Pure Functions

__*Pure Functions*__ são funções que ao executarem não produzem efeitos colaterais no sistema, ou seja, ao executar uma __*Pure Function*__ somente valores das variáveis definidas dentro do escopo da função podem ser alteradas. Assim sendo, variáveis globais não podem ser modificadas em uma __*Pure Function*__ pois ela deixa de ser _PURE_.

> Pure Functions devem ser idempotentes, ou seja, não alterar a saída de uma função dada a mesma entrada.

## [Immutable variables](imutabilidade.exs)

As variáveis nunca são sobrescritas ao ser utilizada como argumento de uma função. Dessa maneira ao passar uma variável para uma função estamos passando uma cópia dela.

## Recursion

Funções recursivas são funções que podem realizar chamadas a si mesma.

## Non-strict evaluation

Também conhecido como __*Lazy Evaluation*__, é uma característica das linguagens funcionais que alocam memória a uma variável somente quando ela for usada.

## Statements

Statements em programação funcional é dizer que cada declaração(statement), ou seja, cada linha, cada verbo, cada ação do código produz algum valor de retorno; desde atribuições até funções que não possuem retorno explicíto.

## [Pattern matching](entendendo_pattern_matching.exs)

É uma forma de diminuir a necessidade de variáveis procurando padrões em objetos durante a execução. Esses objetos podem ser funções, estruturas de dados etc.