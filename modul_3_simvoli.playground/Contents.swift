//import UIKit
 
// конкатенация (обьединение) происходит с помошью метода append()
var welcome: String = "Welcome"
let exclamationMark:Character = "!"
welcome.append(exclamationMark)


let dogString = "Dog!!\u{1F436}" //unicod
print(dogString)

// подсчет символов
let animals = "Кола, Улитка, Пингвин, Верблюд"
print("animals содержит \(animals.count) cbvволов")


// доступ по индексу
var greeting = "Hi"
greeting[greeting.startIndex]


// вставка по индексу
greeting.insert("!", at: greeting.startIndex)

//Character- специальный тип символ
 
let letterA: Character = "A"
let heartSymbol: Character = "\u{2665}"

///
/*
let str = "Hello"
let index = str.index(str.startIndex, offsetBy: 2)
let character = str[index]
print(character) // Вывод: "l"

let str = "Hello, World!"
let startIndex = str.index(str.startIndex, offsetBy: 7)
let endIndex = str.endIndex
let range = startIndex..<endIndex
print(str[range]) // Вывод: "World!"


let str = "Hello, World!"
let suffixSubstring = str.suffix(6)
let newString = String(suffixSubstring)
print(newString) // Вывод: "World!"

let str = "Hello, World!"
*/
 
 
 
let suffixSubstring = str.suffix(6)
print(suffixSubstring) // Вывод: "World!"
