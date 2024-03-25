import Foundation

/*
Задание 1
Дополните функцию nextNumber() так, чтобы она получала целое число и возвращала число, следующее за ним по порядку.
func nextNumber(number: Int) -> Int {
    // Ваш код должен быть здесь
}
Вызовите получившуюся функцию. Убедитесь, подставляя различные аргументы, что функция работает корректно.
Пример:
Вызов: nextNumber(number: 5)
Вывод в консоль: 6
*/
func nextNumber(number: Int) -> Int {
    let number = number + 1
    return number
}
nextNumber(number: 5)
//print(nextNumber(number: 5))



/*
 Задание 2
 В предыдущем задание, вы вызвали существующую функцию. В этом задании требуется сделать обратное, т.е. вам нужно по описанию вызова функции ее создать.
 let value = getSquare(number: 3)
 print(value)
 Дан вызов функции. Превратите его в функцию, которая вызывается так: getSquare(number: 3) — и возвращает квадрат целого числа, в данном случае 9.
 */
func getSquare (number: Int) -> Int {
    var value = number * number
    //print(value)
    return value
}
getSquare(number: 3)
//print(getSquare(number: 3))



/*
 Задание 3
 Напишите функцию, которая получает на вход количество секунд и возвращает количество минут и оставшихся секунд.
 Пример: в качестве аргумента подаётся 70 секунд, тогда функция возвращает два целых числа. Первое — 1 минуту, второе — 10 секунд.
 Подсказки:
 Используйте кортеж, содержащий два значения: количество минут и секунд.
 Переменная, в которой хранится кортеж, имеет тип (minutes: Int, seconds: Int).
 Для получения остатка используйте оператор, возвращающий остаток от деления.
 Вызовите вашу функцию и выведите количество минут и секунд отдельными инструкциями print().
 */
func timeNew (_secondNumber: Int) -> (minutes: Int, secondes: Int) {
    var durationInSeconds: Int = _secondNumber
    let minutes = (durationInSeconds % 3600) / 60
    let seconds = durationInSeconds % 60
    return (minutes, seconds)
}
var secondNumber = 70
timeNew(_secondNumber: secondNumber)
//print(timeNew(_secondNumber: secondNumber))



/*
Задание 4
Напишите функцию, которая будет конкатенировать (объединять) две строки в одну.
Вызовите вашу функцию и сохраните результат в переменную.
Выведите результат в консоль. Для проверки используйте константы ниже.
let string1 = "Writing Swift code "
let string2 = "is interactive and fun"
*/

func wordName() -> (String) {
    let string1 = "Writing Swift code"
    let string2 = "is interactive and fun"
    let fullname = string1 + " " + string2
    return fullname
}
wordName()
var result = wordName()
//print(wordName())
//print(result)



/*
 Задание 5
 Напишите функцию, которая на входе будет получать дату в виде строки (например, "2004-11-23"), а на выходе возвращать сущность типа Date.
 Дата задана в формате yyyy-MM-dd.
 Подсказка: для преобразования строки в дату используйте DateFormatter(). DateFormatter при форматировании возвращает optional Date. Чтобы раскрыть optional, используйте значение по умолчанию — текущую дату.
 */

func dateName(date: String) -> Date {
    let currentTime = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let birthdateStr = "2004-11-23"
    let birthdate = dateFormatter.date(from: birthdateStr)!
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: birthdate, to: Date())
    let age = ageComponents.year!
    return currentTime
}
var date = DateFormatter()
date.dateFormat
dateName(date: "")
//print("Текущая время: \(dateName(date: ""))")


func convertDateFormater(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.dateFormat = "2004-11-23"
    let timeStamp = dateFormatter.string(from: Date())
    return timeStamp
}
//var date =  DateFormatter()
convertDateFormater(date: "")
print(convertDateFormater(date: ""))



func dateName(date: String) -> Date {
    let currentTime = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let birthdateStr = "2004-11-23"
    let birthdate = dateFormatter.date(from: birthdateStr)!
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: birthdate, to: Date())
    let age = ageComponents.year!
    return currentTime
}
var date = DateFormatter()
date.dateFormat
dateName(date: "")
//print("Текущая время: \(dateName(date: ""))")








/*
func timeNew (_secondNumber: Int) -> (minutes: Int, secondes: Int) {
    var durationInSeconds: Int = _secondNumber
    let minutes = (durationInSeconds % 3600) / 60
    let seconds = durationInSeconds % 60
    return (minutes, seconds)
}

var secondNumber = 70
timeNew(_secondNumber: secondNumber)
print(timeNew(_secondNumber: secondNumber))
*/


/*
 func timeNew (_secondNumber: Int) -> (minutes: Int, secondes: Int) {
     var durationInSeconds: Int = _secondNumber
     let minutes = (durationInSeconds % 3600) / 60
     let seconds = durationInSeconds % 60
     return (minutes, seconds)
 }
 let secondNumber = 70
 timeNew(_secondNumber: secondNumber)
 print(timeNew(_secondNumber: secondNumber))
 */




//timeNew(_secondNumber: secondNumber)
//let secondNumber = 70
//let formattedDuration = timeNew(_secondNumber: secondNumber)
//print("Duration: \(formattedDuration)")



//timeNew(_secondNumber: 70)
//print("минут\(timeNew(_secondNumber: 125))")


//let durationInSeconds = 90
//let hours = durationInSeconds / 3600
//let minutes = (durationInSeconds % 3600) / 60
//let seconds = durationInSeconds % 60
//print("Duration: \(minutes) minutes, \(seconds) seconds")


/*
func formatDuration(_ durationInSeconds: Int) -> String {
    let (hours, secondsAfterHours) = divmod(durationInSeconds, 3600)
    let (minutes, seconds) = divmod(secondsAfterHours, 60)
   return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
}

func divmod(_ numerator: Int, _ denominator: Int) -> (quotient: Int, remainder: Int) {
    let quotient = numerator / denominator
    let remainder = numerator % denominator
    return (quotient, remainder)
}

let durationInSeconds = 70
let formattedDuration = formatDuration(durationInSeconds)
print("Duration: \(formattedDuration)")
*/
////zsdjkfghjsdfg
