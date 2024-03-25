import Foundation

/*
 Урок 4. Даты
 Тема урока: даты в языке программирования Swift.
 
 
 Даты:
 - тип Date
 - Date использует разницу в секундах для внутренного хранения времени от контрольной даты
 - если присвоить переменной значение вызова Date(), то получим текущую дату
 - DateFormatter выводит дату в нужном формате
 - Calendar отвеччает за математические операции с компонентами даты (сложные, вычитание и так далее)
 
 
 
 За работу с датой и временем в Swift отвечает тип данных Date(), который содержит в
 себе переменные (свойства) и функции. У Date() есть свойство, в котором хранится
 время в виде числа с плавающей запятой 64-bit, измеряющего количество секунд,
 прошедших с контрольной даты 1 января 2001 года в 00:00:00 UTC. UTC — это
 всемирное время, то есть время без часового пояса.
 
 Строка в программе с текущей датой и временем:
 let currentDateTime = Date()
 
 Для создания других дат и времени можно использовать один из следующих
 методов.
 Способ 1. Если вы знаете количество секунд до или после контрольной даты 2001 года:
 let someDateTime = Date(timeIntervalSinceReferenceDate: -123456789.0)
 // Feb 2, 1997, 10:26 AM
 
 
 Способ 2. Используйте DateComponents для указания компонентов, а затем Calendar
 для создания даты. Calendar отвечает за математические операции с компонентами
 даты (сложение, вычитание и так далее).
 // Specify date components
 var dateComponents = DateComponents()
 dateComponents.year = 1980
 dateComponents.month = 7
 dateComponents.day = 11
 dateComponents.timeZone = TimeZone(abbreviation: "JST") // Japan Standard Time
 dateComponents.hour = 8
 dateComponents.minute = 34
 // Create date from components
 let userCalendar = Calendar.current // user calendar
 let someDateTime = userCalendar.date(from: dateComponents)
 Если оставить это поле пустым, то по умолчанию будет использоваться часовой пояс пользователя.
 
 
 Способ 3. Используйте DateFormatter. Он выводит дату в нужном формате:
 "2020-08-04T10:00:00.000Z"
 RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
 RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
 let formatter = DateFormatter()
 formatter.dateFormat = "yyyy-MM-dd HH:mm"
 let someDateTime = formatter.date(from: "2016/10/08 22:31")
 Выводы урока: разобрали даты и методы их использования.
 */

///let currentDateTime = Date()
//print(currentDateTime)


///let someDateTime = Date(timeIntervalSinceReferenceDate: -123456789.0)
//print(someDateTime)

/*
// Specify date components
var dateComponents = DateComponents()
dateComponents.year = 1994
dateComponents.month = 8
dateComponents.day = 23
dateComponents.timeZone = TimeZone(abbreviation: "JST") // Japan Standard Time
dateComponents.hour = 9
dateComponents.minute = 45

// Create date from components
let userCalendar = Calendar.current // user calendar
let someDateTime = userCalendar.date(from: dateComponents)
//Если оставить это поле пустым, то по умолчанию будет использоваться часовой пояс пользователя.
*/

//Способ 3. Используйте DateFormatter.
//Он выводит дату в нужном формате: "2020-08-04T10:00:00.000Z" дата с сервера

//RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
//RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

//let formatter = DateFormatter()
//formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
//let someDateTime = formatter.date(from: "1994-08-23T10:00:08.000Z")




//Первая программа вычисляет разницу в днях между двумя заданными датами и выводит результат.
//Пример:
//В программе заданы даты 01.01.2022 и 31.12.2022.
//Вывод: Разница в днях: 364
/*
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd.MM.yyyy"
let startDate = dateFormatter.date(from: "01.01.2022")!
let endDate = dateFormatter.date(from: "31.12.2022")!
let userCalendar = Calendar.current
let somedateTime = userCalendar.dateComponents([.day], from: startDate, to: endDate)
let daysDifference = somedateTime.day!
print("Разница в днях \(daysDifference)")
*/




//Вторая программа определяет текущее время и выводит его на экран в формате "Часы:Минуты:Секунды".
//Пример:
//Вывод: Текущее время: 10:58:38
/*
let curentTime = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "HH:mm:ss"
let timeString = dateFormatter.string(from: curentTime)
print("Текущее время: \(timeString)")
*/




//Третья программа по заданной дате определяет день недели для этой даты.
//Пример:
//В программе задана дата 20.09.2022
//Вывод: День недели для 20.09.2022: Вторник (Tuesday)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd.MM.yyyy"
let dateStr = "20.09.2022"
let startDate = dateFormatter.date(from: dateStr)!
let userCalendar = Calendar.current
let weekday = userCalendar.component(.weekday, from: startDate)
let daysDifference = userCalendar.weekdaySymbols[weekday - 1]
print("День недели для  \(daysDifference)")


