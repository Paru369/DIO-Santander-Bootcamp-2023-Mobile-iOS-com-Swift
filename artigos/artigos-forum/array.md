<h1> Acessando e Modificando um Array </h1>
Compartilhado por <a href="https://web.dio.me/users/diogopiresmkt?tab=skills" target="_blank"> Diogo Pires </a>
<br>
<br>


Você acessa e modifica uma matriz por meio de seus métodos e propriedades ou usando a sintaxe de subscrito.

Para descobrir o número de itens em uma matriz, verifique sua countpropriedade somente leitura:


```
print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."
```

<br>

Use a propriedade Boolean como um atalho para verificar se a propriedade é igual a :isEmptycount0

```
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}
// Prints "The shopping list isn't empty."
```

Você pode adicionar um novo item ao final de um array chamando o append(_:)método do array:


```
shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes
```

Como alternativa, anexe uma matriz de um ou mais itens compatíveis com o operador de atribuição de adição ( +=):


```
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items
```

Recupere um valor do array usando a sintaxe subscript , passando o índice do valor que deseja recuperar entre colchetes imediatamente após o nome do array:


```
var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"
```

Observação

O primeiro item da matriz tem um índice de 0, não 1. Arrays em Swift são sempre indexados por zero.

Você pode usar a sintaxe de subscrito para alterar um valor existente em um determinado índice:


```
shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"
```

Ao usar a sintaxe de subscrito, o índice especificado precisa ser válido. Por exemplo, escrever para tentar anexar um item ao final da matriz resulta em um erro de tempo de execução.shoppingList[shoppingList.count] = "Salt"

Você também pode usar a sintaxe de subscrito para alterar um intervalo de valores de uma só vez, mesmo se o conjunto de valores de substituição tiver um comprimento diferente do intervalo que você está substituindo. O exemplo a seguir substitui "Chocolate Spread", "Cheese", e "Butter"por "Bananas"e "Apples":


```
shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items
```

Para inserir um item na matriz em um índice especificado, chame o método da matriz:insert(_:at:)

```
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list
```

Essa chamada ao método insere um novo item com valor no início da lista de compras, indicado por um índice de .insert(_:at:)"Maple Syrup"0



Da mesma forma, você remove um item da matriz com o remove(at:)método. Este método remove o item no índice especificado e retorna o item removido (embora você possa ignorar o valor retornado se não precisar dele):

```
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
```

Observação



Se você tentar acessar ou modificar um valor para um índice que está fora dos limites existentes de uma matriz, você acionará um erro de tempo de execução. Você pode verificar se um índice é válido antes de usá-lo, comparando-o com a countpropriedade do array. O maior índice válido em uma matriz ocorre count - 1porque as matrizes são indexadas a partir de zero — no entanto, quando countis 0(o que significa que a matriz está vazia), não há índices válidos.



Quaisquer lacunas em uma matriz são fechadas quando um item é removido e, portanto, o valor no índice 0é novamente igual a "Six eggs":

```
firstItem = shoppingList[0]
// firstItem is now equal to "Six eggs"
```

Se você deseja remover o item final de uma matriz, use o método em vez do método para evitar a necessidade de consultar a propriedade da matriz. Assim como o método, retorna o item removido:removeLast()remove(at:)countremove(at:)removeLast()
```
let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string
```

Iterando sobre um array


Você pode iterar sobre todo o conjunto de valores em uma matriz com o loop for- in:


```
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas
```
Se você precisar do índice inteiro de cada item, bem como de seu valor, use o enumerated()método para iterar na matriz. Para cada item da matriz, o enumerated()método retorna uma tupla composta por um inteiro e o item. Os inteiros começam em zero e contam para cima em um para cada item; se você enumerar sobre uma matriz inteira, esses inteiros corresponderão aos índices dos itens. Você pode decompor a tupla em constantes ou variáveis ​​temporárias como parte da iteração:


```
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
```
Para saber mais sobre o forloop in, consulte For-In Loops .

