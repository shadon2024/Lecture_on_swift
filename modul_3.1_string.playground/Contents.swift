import UIKit

/// Строки
/// - тип String
/// - конкатенация - обьединение строк или символ
/// - интерполяция - замена (наполнителей) помещенных в строку с соответсвующими значениями
 
// строка
let stringValue: String = "string" /// сторка тип явный

/// Проинциализировать сложный текст, где есть цитаты  """ ext """
let quotation = """
I am  Shodon.
I am from Tajikistan.
I am a student.
I am a programmer (ios developer).
I am study in the city Khujand.
I am mareid. I have one sone, but he is beautiful. I love my son.
I have a wife. She is also beautiful. I also love  her
"""
//print(quotation)



/// Инциализация строк мы можем исползовать (специальные символы)
let newLines = "строка 1\nстрока 2\nстрока 3\nстрока 4"
print(newLines)



/// Ициализировать пусты строки а таке же пустая ли строка или нет (проверка строк)
var emptyString = ""
var anotherEmptyString = String()
/// оба строки пусты и эквивалент друг другу
/// можно устнать пустов ли String значения, через его Boolean свойство isEmpty
//print(emptyString.isEmpty)



/// Конкатенация строк   (обьедениение значчение)
var concatentedString = "Skill" + "box"
concatentedString += "!!"



/// Интерполяция строк
let filler = "наполнитель"
let interpolatedString = "строка содержит: \(filler)"

/// пример
let muiltiplier = 3
let message = "\(muiltiplier) times 2.5 is \(Double(muiltiplier) * 2.5)"
print(message)

