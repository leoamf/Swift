//: Playground - noun: a place where people can play
/*
import Cocoa

var str = "Hello, playground"

print(str)


var inteiro = 12
let constante = 18
var texto="O valor é \(constante)"

print(texto + String(inteiro))
print(texto )

print(String(constante) + " " +  texto.capitalized)


var list = ["zcafe",
            "leite","pao"]
var texto2 = "o valor eh \(list[0])"
print(texto2)
list.append("teste")
print( list.sorted(by:<))


var profissoes = ["Telmo":"Aulo", "Joao":"Instrutor", "Felipe":"Professor"]
print(profissoes["Telmo"])


class gente{
    var idade=10
    func dizerIdade() -> String{
        return "Eu tenho \(idade)"
    }
}

var eu = gente()
eu.idade=34
print(eu.dizerIdade())



func returnFifiteen() -> Int{
    var y = 10
    func add(){
        y+=5
    }
    add()
    return y
}

print(returnFifiteen())



var number = [20,19,7,12]
let others = number.map({(number: Int ) -> Int in
    let result = 3*number
    return result
})
print(others)
*/


let  nomes = ["leo","ateste","ztestes123"]
var  reverso = nomes.sorted(by: {(s1:String ,s2:String)-> Bool in return s1>s2})
reverso = nomes.sorted(by: {(s1 ,s2)-> Bool in  s1>s2}) // sem definiçao de tipo e return
reverso = nomes.sorted(by:{$0>$1}) // sem variaveis e retorno, apenas com indicadores
reverso = nomes.sorted(by:>)// sem identificacao
reverso = nomes.sorted(){$0>$1}

print(nomes)
print(reverso)
var outroNomes = nomes.map{(n ) -> String in
     n.uppercased()
}
outroNomes = nomes.map{$0.uppercased()}
print(outroNomes)

for m in outroNomes{
    print(m)
}

class C {
    var a: Int = 0;
    init() {
        
    }
}

//Enums
enum A{
    case a,b,c
}

var enumTeste: A = A.a
enumTeste = .b





