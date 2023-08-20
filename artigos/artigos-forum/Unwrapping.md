<h1> Dicas de Unwrapping com (alguma) segurança </h1>
Compartilhado por <a href="https://web.dio.me/users/paruvitu" target="_blank"> Paulo Pinheiro </a>
<br>
<br><br>
No Swift, você pode fazer o UnWrapping(desembrulhar) valores opcionais (possivelmente nulos) com segurança usando diversas abordagens. Aqui estão algumas das principais formas de fazer isso, além do que foi demonstrado na aula.
<br>


- Nil Coalescing Operator (Operador de Coalescência Nula): O operador ?? permite que você forneça um valor padrão para ser usado se o valor opcional for nulo:
```
let unwrappedValue = optionalValue ?? defaultValue 
```
<br>

- Optional Chaining: Você pode usar o encadeamento opcional para acessar propriedades e métodos de um valor opcional, e se o valor opcional for nulo, todo o encadeamento retornará nulo:
<br>
```
let length = text?.count 
```

- if let ou guard let: Você pode usar a estrutura if let ou guard let para desembrulhar opcionalmente um valor e usá-lo somente se ele não for nulo:
```
if let unwrappedValue = optionalValue { // O unwrappedValue não é nulo, você pode usá-lo aqui } else { // O optionalValue é nulo } 
```
<br>
- Optional Binding em Força-Maior: Em situações em que você tem certeza de que o valor opcional não é nulo (em um contexto específico), você pode usar o operador de força-maior (!) para desembrulhar forçadamente:
```
let unwrappedValue = optionalValue! 
```
<br>

É importante lembrar que o uso excessivo do desembrulho forçado (!) pode levar a falhas de runtime se o valor for realmente nulo. O ideal é sempre usar abordagens seguras, como if let, guard let ou o operador de coalescência nula, para evitar possíveis crashes do aplicativo.

A escolha de qual abordagem usar depende do contexto e das garantias de segurança que você deseja implementar no seu código.
<br>

