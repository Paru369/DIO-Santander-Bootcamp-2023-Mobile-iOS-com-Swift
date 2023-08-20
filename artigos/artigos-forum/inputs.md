<h1> Dicas para pegar inputs em Swift </h1>
Compartilhado por <a href="https://web.dio.me/users/allefschmidt" target="_blank"> Allef Schmidt </a>
<br>
<br>

Essa dica é para ajudar aqueles que tem dúvidas de como pegar um input através do terminal na linguagem swift, serve tanto para quem tem mac tanto para quem utilizar as plataformas online para compilar código swift, isso pode ajudar muito na resolução dos primeiros desafios, espero que ajude algum de vocês.



Em programação Swift, os inputs geralmente são lidos a partir da entrada padrão, que é o terminal quando você está interagindo com um programa por linha de comando. Existem várias maneiras de ler inputs do terminal em Swift. Aqui estão alguns exemplos:


<h2>
Usando readLine():
</h2>
O método readLine() permite que você leia uma linha de texto da entrada padrão. Ele retorna um valor opcional (que pode ser nil se não houver mais entrada).
```
if let input = readLine() {
    print("Você digitou: \(input)")
}
```

Convertendo para outros tipos de dados:

A entrada lida usando readLine() é sempre tratada como uma string. Se você quiser converter a entrada para outros tipos de dados, como inteiros ou números de ponto flutuante, você precisa fazer a conversão explicitamente:
```
if let input = readLine(), let intValue = Int(input) {
    print("Você digitou um número inteiro: \(intValue)")
}
```

Para ler múltiplos inputs, você pode simplesmente usar o readLine() várias vezes:
```
print("Digite seu nome:")
if let name = readLine() {
    print("Olá, \(name)! Qual a sua idade?")
    if let ageInput = readLine(), let age = Int(ageInput) {
        print("Você tem \(age) anos.")
    }
}
```

Você também pode criar funções auxiliares para ler inputs e converter para tipos específicos:
```
func readInt() -> Int? {
    return Int(readLine() ?? "")
}
```
```
if let age = readInt() {
    print("Você tem \(age) anos.")
}
```
