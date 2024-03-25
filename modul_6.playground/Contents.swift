import UIKit


//Основы Swift разработки. Часть 5. Работа со словарями
/*
 Описание
 В данном модуле вы ознакомитесь с таким типом коллекций, как словари, и научитесь:

 создавать словари,
 создавать типы данных с помощью перечислений,
 обрабатывать ошибки во время работы приложений.
 Словари хранят неупорядоченные значения, у каждого значения есть свой идентификатор, называемый ключом. В данном модуле вы научитесь обращаться со словарями и ключами.

 Вы узнаете о доступе к элементам словаря, для этого мы обратимся к официальному сайту компании Apple и изучим его.

 Вы поймёте, как обрабатывать ошибки, научитесь ловить их. Ознакомитесь с функцией возвращения ошибок. Рассмотрите варианты:

 вернуть особенное число,
 вернуть пустое значение,
 написать инструкцию.
 Вы изучите перечисления (enum), то есть научитесь создавать собственные типы данных с ограниченным количеством возможных значений. Таковыми могут быть:

 оценка ученика (1–5),
 состояние загрузки данных (загружаются / загрузка завершена / ошибка).
 */

/// Цель и задачи модуля
// Цель:  научиться работать со словарями, перечислениями и обработать ошибки во время работы приложения
/// Задачи:
// - научиться создавать словари
// - узнать как получить доступ к элементам словарей
// - понять как верно использовать возможность создавать и обрабатывать ошибки
// - узнать как создавать свои типы данных с помощью перечислений (Enum)

/// 6.2 Словари

/*
 Описание
 Пример использования словарей на практике: приложения, связанные с датами и календарями, могут использовать словари, чтобы сохранять записи для определённых дат.

 Тогда такой словарь будет иметь вид: var notes: Dictionary<Date: [String]>. Для даты мы будем хранить набор записей — [String].



 Объяснение: Any

 Any — тип данных, который может сохранить в себе значение любого типа. Но в таком случае все знания о типе этого объекта будут потеряны, и его новым типом станет Any.

 Мы можем написать так: let everything: [Any] = [“banana”, 123, False]. Но теперь мы не сможем обращаться с элементами этого массива как со строками, числами или логическими переменными.

 Мы не сможем написать everything[0].count или everything[1] + 1.

 На практике Any используется, когда нам важен факт наличия некоторого объекта, но не его свойства.

 */

// Словарь - это контейнор для неупорядоченного хранения ассоциативных значчений (ключ - значение)
// - тип Dictionary
// - значения хранятся неупорядоченно
// - значения могут быть типа optional,ключи - нет
// - ключи должны быть хешируемые
// - передаются по значению
// - значчения могут повторятся, ключи - нет


//словари
// когда используются
// используются:
// - для хранения данных, полученных из Json
// - для хранения описаний кодов ошибки, где ключ - это код ошибки, а значение - описание ошибки

/// Инциализация словаря

// Явно указываем тип
let explisType: [Int: String] = [:]

// Не явно указываем тип
let explisType1 = [Int: String]()

// Тип словаря определяется по типу значчений
let  explisTyp2 = [1: "one"]

// Инциализация пустого словаря
let explisType3: [String: String] = [:]

// Ключ должен быть хешируемим
// Значение Any - может предаставлять экземпляр любого типа
let dicitonary = Dictionary<String, Any>()




/// 6.3 Доступ к элементам словаря

var numberDictionary = [0:"zero", 1:"one", 10:"ten"]
print("The number dictionary contains \(numberDictionary.count) items")
print("isProperty equals \(numberDictionary.isEmpty)")

// добавление новий элемент
numberDictionary[5] = "five"
numberDictionary[11] = "eleven"

if let eleven =  numberDictionary[11]   {
    print(" the name of number is\(eleven).")
} else {
    print("the name of number isn't exist.")
}

// Это выражение возвращает удаленный элемент
let removedValue = numberDictionary.removeValue(forKey: 0)

for (key, value) in numberDictionary {
    print("\(key): \(value)")
}

for key in  numberDictionary.keys {
    print("\(key)")
}



/// 6.4 Обработка ошибок
//● Можем создавать свои ошибки
//● Функция может выбрасывать ошибку, поэтому для неё нужен соответствующий синтаксис
//● Ошибку можно передавать из функции в функцию
//● Для обработки ошибки используем конструкцию Do-Catch

enum ValidationError: Error, LocalizedError{
    case tooShort
    case tooLong
    case invalidCharacterFound(Character)
    
    var errorDescription: String? {
        var description = ""
        
        switch self {
        case .tooShort:
            description = "Too Short"
        case .tooLong:
            description = "Too Long"
        case let.invalidCharacterFound(char):
            description = "Invalid Char \(char)"
        }
        return description
    }
}

//func canThrowErrors() throws -> String {return String()}
//func cannotThrowErrors() -> String {return String()}

func validate(username: String) throws {
    guard username.count > 3 else {
        throw ValidationError.tooShort
    }
    
    guard username.count < 15 else {
        throw ValidationError.tooLong
    }
    
    for character in username {
        guard character.isLetter else {
            throw ValidationError.invalidCharacterFound(character)
        }
    }
}


func onUserInputName(username: String) {
//    do {
//        try validate(username: username)
//        // если валидация не вернула нам ошибку, значить
//        //пользователь ввел валидное имя пользователя
//        print(username)
//
//    } catch {
//        // если мы попали сюда значит произошла ошибка
//        // ее надо обработать здесь
//        print(error.localizedDescription)
//    }
    print((try? validate(username: username)) == nil)
}
onUserInputName(username: "John1")




///Описание
///Перечисление — это тип данных, который определяет некоторый набор различных значений и соответствующих им значений. Советуем вам прочитать подробнее о перечислениях.

//Перечисления (Enum)
//● При объявлении перечисления вы создаёте свой тип данных
//● Явно указываются возможные значения
//● Можно добавить методы для расширения функциональности Enum
//● Значения обрабатываются с помощью Switch
//● Часто используются для логически связанных строковых значений
//● Удобно использовать для констант

//enum CompassPoint {
//    case north
//    case south
//    case east
//    case west
//}

/*
 Итоги модуля
 ● Узнали, как использовать словари
 ● Узнали, как обрабатывать ошибки
 ● Создали свои типы данных с помощью Enum
 ● Дополнительно можно почитать:
   ○ словари
   ○ обработка ошибок
   ○ перечисления в Swif
 */

// Перечисления

enum CompassPoint { // enum CompassPoint: String { изходное значчение
    // enum CompassPoint: Int  { порядковый номер
    case north
    //case south = 5 // явно указываем исходное значение
    case south(String, Int) // асоциативных значения
    case east
    case west
    
    // добавим метод
    func getDescription() -> String {
        switch self {
        case .north:
            return "north"
        case let .south(name, index):
            return "\(name) - \(index)"
        case .east:
            return "east"
        case .west:
            return "west"
        }
    }
}

// проинциализируем переччисления типа CompassPoint
let compassPoint = CompassPoint.east
compassPoint.getDescription()

//let directionTohead: CompassPoint = .south("south", 1)

//switch directionTohead {
//case .north:
//    print("north")
//case let .south(name, index):
//    print("\(name) - \(index)")
//case .east:
//    print("east")
//case .west:
//    print("west")
//}

// исходное значение или сырое значчение
//print(directionTohead.rawValue)


let days = [0: "Monday", 1: "Tuesday", 2: "Wednesday", 3: "Thursday", 4: "Friday", 5: "Saturday", 6: "Sunday"]
if let one = days[0] {
    print("первый день недели \(one)")
} else {
    print("другой день недели")
}
for (key, value) in days {
    print("\(key): \(value)")
}
for key in days {
    print(key)
}

enum dayWeek {
    case Monday (String, Int)
    case Tuesday (String, Int)
    case Wednesday (String, Int)
    case Thursday (String, Int)
    case Friday (String, Int)
    case Saturday (String, Int)
    case Sunday (String, Int)
}

let direction: dayWeek = .Monday("Monday", 0)
switch direction {
case let .Monday(name, index):
    print("\(name) - \(index)")
case let .Tuesday(name, index):
    print("\(name) - \(index)")
case let .Wednesday(name, index):
    print("\(name) - \(index)")
case let .Thursday(name, index):
    print("\(name) - \(index)")
case let .Friday(name, index):
    print("\(name) - \(index)")
case let .Saturday(name, index):
    print("\(name) - \(index)")
case let .Sunday(name, index):
    print("\(name) - \(index)")
}

//print(direction.raw)

//let direction: dayWeek = .Monday("Monday", 0)

/*
 var numberDictionary = [0:"zero", 1:"one", 10:"ten"]
 print("The number dictionary contains \(numberDictionary.count) items")
 print("isProperty equals \(numberDictionary.isEmpty)")

 // добавление новий элемент
 numberDictionary[5] = "five"
 numberDictionary[11] = "eleven"

 if let eleven =  numberDictionary[11]   {
     print(" the name of number is\(eleven).")
 } else {
     print("the name of number isn't exist.")
 }
 
 for (key, value) in numberDictionary {
     print("\(key): \(value)")
 }

 for key in  numberDictionary.keys {
     print("\(key)")
 }
 */
