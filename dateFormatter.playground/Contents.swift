import UIKit

var greeting = "Hello, playground"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd.MM.yyyy"
let dateStr = "11.08.1950"
let date: Date? = dateFormatter.date(from: dateStr)
let timeString = dateFormatter.string(from: date!)
print("Дата рождения Стива Возняка: \(timeString)")
