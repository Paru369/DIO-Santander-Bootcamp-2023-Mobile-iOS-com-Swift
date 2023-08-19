<h1> Tuplas </h1>
Compartilhado por <a href="https://web.dio.me/users/diogopiresmkt?tab=skills" target="_blank"> Paulo Pinheiro </a>
<br>
<br><br>
Estou estudando Tuplas na faculdade, mas lá é com python, então resolvi fazer um resumo em swift
<br>


Tu plas, em Swift, são um tipo composto. Podemos dizer que uma tupla poderia ser um Collection Type, como um Array, mas de forma mais simplificada, possibilitando que uma variável possa ter vários valores diferentes, e estes valores podem ser acessados por uma chave.
<br>


Exemplo:
```
var tupla = ("Leandro", "Danilo", "Amanda")
Resultado:

tupla: (String, String, String) = {
	0 = "Leandro"
	1 = "Danilo"
	2 = "Amanda"
}
```

Para que possamos acessar o valor de uma tupla, indicamos o nome da variável seguida de seu índice. Assim como no array, o índice inicial da tupla é 0. Veja o exemplo abaixo utilizando a tupla declarada no exemplo anterior.

<br>
```
println("O meu nome é \(tupla.0)")
println("O meu nome dele é \(tupla.1)")
println("O meu nome dela é \(tupla.2)")
```

Diferentemente dos Arrays, as tuplas podem guardar valores de diferentes tipos.



Exemplo:
```
var parceria = ("Quaddro + MacMagazine", 300, 40, 87.3)
```

Resultado:
```
parceria: (String, Int, Int, Double) = {
	0 = "Quaddro + MacMagazine"
	1 = 300
	2 = 40
	3 = 87.299999999999997
}
```

Em Swift permite declararmos tuplas atribuindo nomes aos seus elementos.



Exemplo:
```
var opala = (cilindros: "6 cilindros em linha", potencia: 135 )
```

Resultado:
```
opala: (cilindros: String, potencia: Int) = {
	cilindros = “6 cilindros em linha”
	potencia = 135
}
```
<br>
Acessamos os valores de uma tupla de forma semelhante a como acessamos propriedades de uma classe, utilizando o caractere . — como no exemplo abaixo:
```
opala.cilindros
opala.potencia
```
<br>
Também podemos decompor uma tupla em variáveis.

Exemplo:
```
var (x, y) = opala
```
<br>
Onde a variável x irá receber o valor de cilindros e a variável y irá receber o valor de potência.

Resultado:

```
x: String = "6 cilindros em linha"
y: Int = 135
```
<br>
Podemos ignorar algum valor no momento da decomposição de uma tupla utilizando o caracetere _ (underscore).

Exemplo:
```
var (_, b) = opala
```

Desta forma, o único elemento acessado da tupla será o valor da potência, que sera atribuído à variável b.
