//: Playground - noun: a place where people can play

import UIKit

//clicant a ALT i a l'objecte, es va a la documentació de la classe
 
var profe:String = "miguel" //variable

let num:Int = 8 //constant
let numDist = 3.5

let sleep = num-Int(numDist)

var 🙉:String = "yeheee" //Ctrl+cmd+espaaai
var concatanar:String = profe +  ", " + 🙉

let compliments:[String] =  ["primens", "seconds", "third"]

func compliment() ->String {
    return "MUAHAHAHA"
}

func argumentam(com:String) ->String{
    return compliment() + com
}
//oooooo
func argumentamMillor(toPersonWithName name:String)->String{
    return compliment()+name
}
argumentamMillor(toPersonWithName: "LAIAA")

func suma(numA:Int,_ numB:Int)->Int{ //per defecte, sempre mostra el nom del segon, aixi q hem de posar _ si no ho volem
 return numA+numB
}

for var i=0; i < 3; ++i {
    print(compliments[i])
}

for compliment in compliments {
    print (compliment)
}

for i in 0..<3 {
    
}

profe
