import UIKit

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Não possui toner" {
        throw PrinterError.noToner
    }
    return "Trabalho enviado"
}

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Distribuição \(name)")
    }
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Folha de Pagamento")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Fotos da Praia")
    print(printerResponse)
} catch PrinterError.onFire {
    print("Pegou fogo em tudo bixo")
} catch let printerError as PrinterError {
    print("Erro na impressora: \(printerError)")
} catch {
    print(error)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Não foi possível comprar isso da máquina de venda automática.")
    }
}
do {
    try nourish(with: "Chips com sabor de beterraba")
} catch {
    print("Erro inesperado não relacionado à máquina de venda automática: \(error)")
}

let printerSuccess = try? send(job: 1884, toPrinter: "Memorando")
let printerFailure = try? send(job: 1885, toPrinter: "Não possui toner")

var fridgeIsOpen = false
let fridgeContent = ["leite", "ovo", "sobras"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen =  true
    
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
