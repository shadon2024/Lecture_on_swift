import UIKit

// Логические типы и управление потокам
// Цель и задачи модуля

/// Цель: научиться управлению потокам языка програмирования
/// Задачи:
/// - узнаем, что такое логический оператор if и какие проблемы он решат
/// - научимся раскривать Optionals - переменные с использованием if и guard
/// - узнаем, как обрабативать множество значений с помощью циклов
/// научимся использовать switch для обработки нескольких потенциальных значений

/// Логические типы
/// - Тип Bool.  Два  значения:  true и  false
/// - У String есть свойство .isEmpty.  Возвращает Bool



//let boolValue : Bool = false
//
//let emptyString: String = ""
//print(emptyString.isEmpty)

/// 1 - условие должно содержать код, который возвращает Bool
/// 2 - блок else можно не обьявлять

var userInput1 = "Имя Фамилия"

if userInput1.isEmpty {
    print("Пользователь ниччего не вел")
} else {
    //print(userInput1)
}


let condition1: Bool = 5 > 0
let condition2: Bool = 2 < 4
let condition3: Bool = 5 >= 5
let condition4: Bool = 2 <= 4
let condition5: Bool = 4 == 4
let condition6: Bool = 1 != 4
let condition7: Bool = 1 != 4

// Комбинировать нашее условия
let conditionOr = condition1 || condition2  // (||- это или)
let conditionAnd = condition1 && condition2 // (&&-и)


let temperatur = 15
if temperatur > 25 {
    print("Hot")
} else if temperatur == 0 {
    print("Zero")
}
else {
    //print("Cold")
}


let temperature1 = 31
if temperature1 > 30 && temperature1 < 50  {
    print("Its ok")
} else if temperature1 <= 20  {
    print("Its very cold")
} else {
    print("Its cold")
}


/// Раскрытие Optionals
/// Два способа:
/// - инстукция if let
/// - инстукция guard


/// раскрытия с if let
let userInput: String? = "Skillbox"
func playground(value: String?) {
    if let optionals = value {
        print(optionals)
    } else {
        print("Пустая строка")
    }
}
playground(value: userInput)


/// раскрытия с guard
let userInputt: String? = "Skillbox"
func playgroundd(valuee: String?) {
    guard let valuee = valuee else {
        print("Пустая строка")
        return
    }
    print(valuee)
}
playgroundd(valuee: userInputt)


/// Циклы
/// Мотивация использовать циклы:
/// - снижается дублирование кода
/// - позволяют обработать большое количество значений
///массив - это контейнер которые храниться нашее значение


/// Пример без использования циклов
/// (нам надо отправить писмо пользователям)
let names: [String] = ["John", "Alice", "Bob"] /// это массив набор имен  ["John", "Alice", "Bob"]
func sendEmail(to name: String) {
    print("email was sent to \(name)")
}
sendEmail(to: names[0]) // вызов func через index
sendEmail(to: names[1])
sendEmail(to: names[2])


/// Пример c использования циклов
let namess: [String] = ["John", "Alice", "Bob"]
func sendEmaill (to namee: String) {
    print("email was sent to \(namee)")
}
for namee in namess {       /// Цикль for
    sendEmaill(to: namee)
}


// сумируем число в последовательности от 0 до 1000
// ... это последовательности

//var sum = 0
//for number in 0...1000 {
//    sum += number
//}
//print(sum)  // вводит 500500
//

var sum = 0
for number in 0...1000 {
    if (number % 10 ) == 0 {  /// если наша остатка по отделения будет = 0 (это число делится на 10 без остатков)
        sum += number
    } else {
        continue  ///  когда мы получим число не делится на 10 без остатка, пропускаем, берем следущий не дожидаясь всего окончания цикла
        //break прерывает обработка цикла
    }
    print(number)
}


//var a = 970
//var b = 10
//var c = a / b
//print(c)



func increaseTemperature(_ temperature: Int, by degree: Int) -> Int {
    return temperature + degree
}

var temperature = 0
while(temperature < 30) {
    // Повторить следующий код
    temperature = increaseTemperature(temperature, by: 1)
}
print("while loop, result \(temperature)")

temperature = 0
repeat {
    // Повторить следующий код
    temperature = increaseTemperature(temperature, by: 1)
} while(temperature < 30)
print("repeat loop, result \(temperature)")



/// Switch
// позволяет писать условие для переменных с несколькими значениями
// Switch - (оператор для обработки условие) которая позволит обработать несколько значений. Что делает инструкция  switch. Switch сравнивает значение переменной с несколькими передустановленными, установленниыми значениями или шаблонами

//let someNumber: Int = 4
//switch someNumber {
//case 1:
//    print("Один)
//case 2, 4:
//    print("Два или четыре")
//default:
//}   print("Другое число)

/// обработка несколько значений с помощью else if
// обработка оценки студента
let score: Int = 3
// русское описание оценки
var russianDescription: String?
if score == 1 {
    russianDescription = "\"Кол\""
} else if score == 2 {
    russianDescription = "\"Двойка\""
} else if score == 3 {
    russianDescription = "\"Тройка\""
} else if score == 4 {
    russianDescription = "\"Четверка\""
} else if score == 5 {
    russianDescription = "\"Отлично\""
}
// раскрываем Optionals
if let stringValue = russianDescription {
    print("Оценка \(score), производится как \(stringValue)")
} else {
    print("Оценка \(score), не производится.")
}


/// обработка несколько значений с помощью Switch
// обработка оценки студента
let scor: Int = 3
// русское описание оценки
var russianDescriptions: String?

switch scor {
case 1:
    russianDescriptions = "\"Кол\""
case 2:
    russianDescriptions = "\"Двойка\""
case 3:
    russianDescriptions = "\"Тройка\""
case 4:
    russianDescriptions = "\"Четверка\""
case 5:
    russianDescriptions = "\"Отлично\""
default:
    break
}
// раскрываем Optionals
if let stringValu = russianDescriptions {
    print("Оценка \(scor), производится как \(stringValu)")
} else {
    print("Оценка \(scor), не производится.")
}

/// Итоги модуля
/// - узнали что такое логический опратор if  и какие проблемы он решает
/// - научились раскрывать Optionals переменные с использованием if и guard
/// - выяснили как обрабатывать множество значений с помощью циклов
/// - научились использовать switch для  обработки  нескольких потенциальных значений

/// Укажите дату рождения Стива Возняка (в формате dd.MM.YYYY)
/// let dateFormatter = DateFormatter()

//var evens = [Int]()
//for i in 1...100 {
//  if i % 2 != 0 {
//    evens.append(i)
//  }
//}
//var evenSum = 0
//for i in evens {
//    evenSum += i
//}
//print(evenSum)
