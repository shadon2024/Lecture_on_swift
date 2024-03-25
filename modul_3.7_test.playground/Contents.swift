import UIKit

/*
 Первая программа вычисляет разницу в днях между двумя заданными датами и выводит результат.
 Пример:
 В программе заданы даты 01.01.2022 и 31.12.2022.
 Вывод: Разница в днях: 364
 
 Вторая программа определяет текущее время и выводит его на экран в формате "Часы:Минуты:Секунды".
 Пример:
 Вывод: Текущее время: 10:58:38
 
 Третья программа по заданной дате определяет день недели для этой даты.
 Пример:
 В программе задана дата 20.09.2022
 Вывод: День недели для 20.09.2022: Вторник (Tuesday)
 
 Четвертая программа по заданной дате рождения вычисляет текущий возраст человека и результат выводит в консоль.
 Пример:
 В программе задана дата 15.06.1988
 Вывод: Возраст: 35 лет
 */


///Первая программа вычисляет разницу в днях между двумя заданными датами и выводит результат.
///Пример:
///В программе заданы даты 01.01.2022 и 31.12.2022.
//Вывод: Разница в днях: 364
//let dateFormatter = DateFormatter()
//dateFormatter.dateFormat = "dd.MM.yyyy"
//let startDate = dateFormatter.date(from: "01.01.2022")!
//let endDate = dateFormatter.date(from: "31.12.2022")!
//let calendar = Calendar.current
//let dateComponents = calendar.dateComponents([.day], from: startDate, to: endDate)
//let daysDifference = dateComponents.day!
//print("Разница в днях: \(daysDifference)")


/// Вторая программа определяет текущее время и выводит его на экран в формате "Часы:Минуты:Секунды".
//Пример:
//Вывод: Текущее время: 10:58:38
//let currentDateTime = Date()
//let dateFormatter1 = DateFormatter()
//dateFormatter1.dateFormat = "HH:mm:ss"
//let timeString = dateFormatter1.string(from: currentDateTime)
//print("Текущее время: \(currentDateTime)")



/// Третья программа по заданной дате определяет день недели для этой даты.
//Пример:
//В программе задана дата 20.09.2022
//Вывод: День недели для 20.09.2022: Вторник (Tuesday)
//let dateFormatter = DateFormatter()
//dateFormatter.dateFormat = "dd.MM.yyyy"
//let dateStr = "20.09.2022"
//let date = dateFormatter.date(from: dateStr)!
//let calendar = Calendar.current
//let weekday = calendar.component(.weekday, from: date)
//let weekdayString = calendar.weekdaySymbols[weekday - 1]
//print("День недели для \(dateStr): \(weekdayString)")



///Четвертая программа по заданной дате рождения вычисляет текущий возраст человека и результат выводит в консоль.
//Пример:
//В программе задана дата 15.06.1988
//Вывод: Возраст: 35 лет

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd.MM.yyyy"
let birthdateStr = "15.06.1988"
let birthdate = dateFormatter.date(from: birthdateStr)!
let calendar = Calendar.current
let ageComponents = calendar.dateComponents([.year], from: birthdate, to: Date())
let age = ageComponents.year!
print("Возраст: \(age) лет")
