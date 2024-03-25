import Foundation

///  Числовые типы

/// varA  неявный тип Int
var varA = 42
print(varA)

/// varB не явный тип Double
var varB = 3.14159
print(varB)

/// varС не явный тип Double
var varC = 3 + 0.14159
print(varC)


var a: Int = 10
a = a + 1
a = a - 1
a = a * a
print(a)


/// В панели справа увидим значения 10, 11, 10 и 100  соответсвенно. Теперь попробуем
var b = 10
b += 10
b -= 10
print(b)
// += это значить добавить и присвоить значчения. Подобно рассказать


/// Для других типов тоже работает
var d = 1.1
var e = 2.2
var f = d + e
print(f)


/// % - остаток от деления пример с таймером
9 % 3 // = 0
10 % 3 // = 1

var g = 700 % 60
print(g)



/// Сравнение

var h = 1.1
var j = 2.2
var k = h + j
print(k)

let variableBool: Bool = k > 3
k >= 3
k > 4
k < 4

