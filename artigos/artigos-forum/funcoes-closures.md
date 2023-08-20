
<h1>
Funções e Closures em Swift</h1>
Compartilhado por <a href="https://web.dio.me/users/paruvitu" target="_blank"> Paulo Pinheiro </a>


<h2>
Funções:
  </h2>
As funções são blocos de código que executam uma tarefa específica. Em Swift, as funções têm um nome, podem aceitar parâmetros e retornar valores. Elas podem ser definidas com os seguintes elementos:

Nome da Função: Identifica a função.
Parâmetros: Valores que podem ser passados para a função quando ela é chamada.
Corpo da Função: Onde o código da função é definido.
Valor de Retorno: O valor que a função retorna após sua execução.
Exemplo de uma função simples em Swift:

```
func saudacao(nome: String) -> String {
    return "Olá, \(nome)!"
}
```

<h2>
Closures:
  </h2>
Closures são blocos de código independentes que podem ser tratados como valores em Swift. Eles podem capturar e armazenar referências para variáveis e constantes de seu contexto circundante. Closures são usados para criar funções anônimas e podem ser atribuídos a variáveis ou passados como argumentos para outras funções.

Exemplo de um closure em Swift:

```
let multiplicador: (Int, Int) -> Int = { a, b in
    return a * b
}

let resultado = multiplicador(5, 3) // Resultado será 15
```

<h2>
Diferenças entre Funções e Closures:
</h2>

Sintaxe: Funções têm uma sintaxe mais explícita, enquanto closures podem ser escritos de forma mais concisa.
Nome: Closures podem ser anônimos, enquanto funções têm um nome definido.
Contexto: Closures capturam variáveis e constantes do contexto em que são definidos, enquanto funções não capturam automaticamente valores do contexto circundante.
Uso: Closures são frequentemente usados para operações simples ou como argumentos para funções de ordem superior (como map, filter, etc.), enquanto funções são usadas para encapsular tarefas maiores e mais complexas.
Captura de Valores: Closures podem capturar e manter valores do ambiente circundante, o que pode ser útil em alguns cenários.
Em resumo, funções e closures são blocos de código que realizam tarefas específicas em Swift. Funções têm um nome e podem ser chamadas usando esse nome, enquanto closures podem ser anônimos e tratados como valores. Ambos são elementos essenciais da programação em Swift e são usados em diferentes contextos para atender às necessidades de codificação.
