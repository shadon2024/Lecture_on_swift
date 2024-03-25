import Foundation

// Типы данных

/// Строка
var stringVar: String = "String"

/// Int
var intVar: Int = 40

/// Double
var doubleVar: Double = 11.0

/// Date
var dateVar: Date = Date()

var implicityDouble = 11

var result = Double(implicityDouble) + doubleVar

/*
print(stringVar)
print(intVar)
print(doubleVar)
print(dateVar)
print(implicityDouble)
print(result)
*/



/// Optionals
/// Переменная Optional с типом  строка

var stringVaro: String? = "String"
///var stringVaro: String? = nil

///print(stringVaro)
///print(stringVaro ?? "Это переменная не пустаяв")

// print(stringVaro!) такой тип небезапасно при пустой значения  nil
print(stringVaro!)





/// Числовые типы.
/// Целочисленные типы

