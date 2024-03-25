import UIKit

// Описание
//В этом модуле вы узнаете, что такое протоколы и как они применяются в программировании под iOS.
//
//Вы научитесь создавать и использовать протоколы и узнаете, какие требования и ограничения можно накладывать на их реализацию.
//
//На практике вы научитесь реализовывать протоколы Equatable, Hashable, а также собственные протоколы с помощью структур.
//
//Помимо этого, вы узнаете:
//
//как и в каких случаях используются протоколы;
//как внедрять зависимости с помощью протоколов;
//как создавать расширения классов, структур и перечислений с помощью Extension и как их использовать вместе с протоколами.

//Цель и задачи модуля
//Цель: познакомиться с протоколами. Узнать, как их
//создавать и использовать. А также узнать, как работают
//расширения и как их использовать вместе с протоколами.
//Задачи:
//● рассмотреть использование протоколов
//● рассмотреть внедрение зависимостей
//с помощью протоколов
//● изучить расширение функциональности
//с помощью Extension

//Протоколы
//Протокол — это контракт, который может содержать свойства, методы
//и другие требования, удовлетворяющие определённой задаче
//или части функциональности.


//Протоколы
//Используются:
//● для применения абстракций в коде
//● для реализации внедрения зависимостей
//Реализуют:
//● классы, структуры и перечисления
//Swift был назван протокол-ориентированным
//языком на конференции WWDC.
//Ссылка на запись конференции.


//Внедрение зависимостей
//Внедрение зависимостей ещё называется
//Dependency Injection или DI.
//Внедрение зависимостей — это шаблон
//проектирования, при котором поля
//или параметры создания объекта
//конфигурируются извне.
//Например, таким образом
//упрощается написание тестов.



struct Provider: ProviderProtocol {
    func providerItems() -> [String] {
        return ["one", "two", "three"]
    }
    

//    func prividerItems() -> [String] {
//        return ["one", "two", "three"]
//    }
}

class ProviderMock: ProviderProtocol {
    var items: [String] = []
    var providerCallCount: Int = 0
    
    init() {}
    
    func providerItems() -> [String] {
        providerCallCount += 1
        return items
    }
}

protocol ProviderProtocol {
    func providerItems() -> [String]
}

class ViewModel {
    let provider: ProviderProtocol
    
    init (provider: ProviderProtocol) {
        self.provider = provider
    }
    
    func loadItems() {
        provider.providerItems()
    }
}

let viewModel = ViewModel(provider: ProviderMock())
viewModel.loadItems()


// передаем как зависимость
let mock = ProviderMock()
let viewModel1 = ViewModel(provider: mock)
viewModel1.loadItems()

// сколько раз визывался mock
print(mock.providerCallCount)




// 10.3 Требования протоколов
// MARK: - Свойства

protocol SomeProtocol {
    var mustBeSettable: Int { get set}
    var doesNotNeedToBeSettable: Int { get }
}

struct SomeStruct: SomeProtocol {
    var mustBeSettable: Int
    private(set) var doesNotNeedToBeSettable: Int
}

var someStruct = SomeStruct(mustBeSettable: 1, doesNotNeedToBeSettable: 2)
someStruct.mustBeSettable = 3
// someStruct.doesNotNeedToBeSettable = 4


protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}

protocol FullNamed {
    var fullName: String {get}
}




// MARK: - Методы

protocol SomeProtocolWithMethod {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random(value: Int) -> Double
}

protocol Togglable {
    mutating func toggle()
}



// MARK: - Инциализаторы

protocol WithInitProtocol {
    init(someParametr: Int)
}

class SomeClass: WithInitProtocol {
    init() {}
    required init(someParametr: Int) {
        // реализация (этот инциализатор прищел из протокола)
    }
}


// наследование Protocol
protocol OneProtocol {}
protocol TwoProtocol: OneProtocol {}

struct Car: NameProtocol {
    func getName() -> String {
        "Car"
    }
    
    let wheelNumber = 4
}

struct Bird: NameProtocol {
    func getName() -> String {
        "Bird"
    }
    
    let name: String
}

protocol NameProtocol {
    // возвращает имя сущности String
    func getName() -> String
}


// массив по нему пробежим
// создаем массив явный тип NameProtocol, инциализируем struct Сar(), Bird()

let array : [NameProtocol] = [Car(), Bird(name: "Parrot")]
// пройдем по цикле и вывести название
array.forEach { item in
    print(item.getName())
}

// две разные struct обьеденинени с помощью protocol





// MARK: -  10.4 Реализация протоколов

//Swift предоставляет синтезированную реализацию протокола Equatable для:
//● структур, которые имеют только свойства хранения и соответствуют протоколу Equatable
//● перечислений, которые имеют только ассоциативные типы и соответствуют протоколу Equatable
//● перечислений, которые не имеют ассоциативных типов


//Swift предоставляет синтезированную реализацию протокола Hashable для:
//● структур, имеющих только свойства хранения, которые соответствуют протоколу Hashable
//● перечислений, имеющих только ассоциативные типы, которые соответствуют протоколу Hashable
//● перечислений, не имеющих ассоциативных типов


//Реализация протокола:
//● может быть ограничена только для классов
//● можно использовать объединение Protocol1 & Protocol2
//● можно проверять реализацию протокола с помощью оператора is, который возвращает true или false

// сравнение протокола или структура
struct SomeStructure: Equatable {
    let stringvalue: String
    let intValue: Int
}

// инстанст
let structur1 = SomeStructure(stringvalue: "one", intValue: 1)
let structur2 = SomeStructure(stringvalue: "one", intValue: 2)

structur1 == structur2

if structur1 == structur2 {
    print("ok")
} else {
    print("not")
}


// Hashable
struct SomeStructure1: Hashable {
    let stringvalue: String
    let intValue: Int
}

// создаем словар кал ключь
// инстанст
let structur3 = SomeStructure1(stringvalue: "one", intValue: 1)

let dictionary: [SomeStructure1: String] = [structur3: "one"]


// MARK: способ ограничить реализация для классов
//● может быть ограничена только для классов
//● можно использовать объединение Protocol1 & Protocol2
//● можно проверять реализацию протокола с помощью оператора is, который возвращает true или false

protocol SomeClassOnlyProtocol: AnyObject {
    // определение протокола типа class-only
}

//struct SomeStructt: SomeClassOnlyProtocol {
//
//} ошибка



protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

// реализуем этот протокол
struct Person: Named, Aged {
    var name: String
    var age: Int
}

// функция выводит поздравления
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("С Днем Рождения, \(celebrator.name)! Тебе уже \(celebrator.age)! ")
}

// инстанс struct
let person = Person(name: "Anton", age: 21)
wishHappyBirthday(to: person)



// MARK: 10.5 Расширения
//Расширения полезны, когда нам нужно добавить функциональность в уже существующий тип, который находится в другом модуле, и мы не можем сделать это напрямую.
//● С помощью расширений можно добавлять функциональность к уже существующим сущностям
//● Расширения работают с протоколами, позволяя сущностям соответствовать им
extension String {
    func firstWord() -> String {
        let spaceIndex = firstIndex(of: " ") ?? endIndex
        let word = prefix(upTo: spaceIndex)
        return String(word)
    }
}

let someLongString = "One Two Three"
print(someLongString.firstWord())



// расширения для протокола
protocol SomeProtocoll{}

extension SomeProtocoll {
    func sayHi(){
        print("Hi")
    }
}

struct Somestructuree: SomeProtocoll{}
let somestructuree = Somestructuree()
somestructuree.sayHi()


// получение описания обьекта функции для разных типов
func printDescription() {
    
}
protocol StringRepresentable {
    var stringValue: Int {get}
}



//protocol PersonProtocol {
//    var name: String {get}
//    func reactOnDanger()
//}
//extension PersonProtocol {
//    func reactOnDanger() {
//        print("help")
//    }
//}
//struct Personn: PersonProtocol {
//    var name = "Jhon"
//}
//
//let personn = Personn()
//personn.reactOnDanger()


protocol PersonProtocol {
    var name: String {get}
    func reactOnDanger()
}

extension PersonProtocol {
    func reactOnDanger() {
        print("help")
    }
}
// добавляем расширения суппер сила
protocol SuperPoweradle {}

extension PersonProtocol where Self: SuperPoweradle {
    func reactOnDanger() {
        print("use supperpowers")
    }
}

struct Personn: PersonProtocol, SuperPoweradle {
    var name = "Jhon"
}

let personn = Personn()
personn.reactOnDanger()




// MARK: 10.6 Протоколы

//Определение
//Swift — протокольно-ориентированный язык. Чтобы понять, как он работает, нужно изучить протоколы.
//
//Протокол — это тип данных, декларация, описывающая тип, и средство обобщения различных типов, который можно использовать с class, struct, enum.
//
//С помощью протоколов определяются требования, которые должны реализовывать типы, соответствующие этим протоколам. Протокол может быть принят классом, структурой или перечислением. Требования включают в себя: свойства, методы, конструкторы и статические методы.
//
//Другими словами, протокол описывает, как должна выглядеть реализация. Таким образом, протокол — абстрактный тип данных, который отличается от таких стандартных типов, как String, Int и другие.
//
//Протокол можно также обозначить как шаблон требований.
//
//Можно сказать, что в жизни мы тоже пользуемся такими протоколами. Например, во время написания курсовых мы опираемся на требования к оформлению работы — шаблон, который включает название работы, Ф.И.О. студента, дату и другую информацию. Похожим образом протокол определяет набор данных, которые должны быть реализованы, в то время как остальные содержательные элементы могут отличаться.





// MARK: Синтаксис

//Определение протокола очень похоже на определение классов, структур и перечислений:

protocol SomeProtocoli {
    //здесь определение протокола
}
//Пользовательские типы заявляют, что они принимают протокол. Для этого имя протокола размещается после имени пользовательского типа и отделяется двоеточием. Несколько протоколов разделяются запятыми.

struct SomeStructt: SomeProtocoli {
    //здесь определение структуры
}
//Если у класса есть суперкласс, укажите его название перед названиями протоколов и отделите запятой:

class SuperClass {
}
protocol AnotherProtocoll {
}
class SomeClasst: SuperClass, SomeProtocoli, AnotherProtocoll {
    //здесь определение класса
}



// MARK: Требования свойств

//Протокол требует предоставить свойство с определённым именем и типом у соответствующего ему типа. Протокол не указывает, хранить или вычислять свойство, только определяет его имя и тип. Также от набора правил зависит доступность свойства для получения и установки или только для получения. Эти параметры обозначаются ключевыми словами get (получаемое) и set (устанавливаемое).

//Обратите внимание, что свойство не доступно только для установки, поэтому возможные варианты свойств: получение и установка { get set } и получение { get }.

//Требования к свойствам всегда объявляются как переменные свойства с префиксом ключевого слова var.

//Пример протокола:

protocol SomeProtocolh {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable : Int { get }
}
//В примере выше свойство mustBeSettable доступно для чтения и изменения. Поэтому его нельзя объявлять константой, только переменной. Кроме того, свойство не может быть вычисляемым.

//А свойство doesNotNeedToBeSettable доступно только для чтения.

//В момент создания протокола вы описываете содержимое потенциального типа, который затем используете (следовать протоколу, подписаться на протокол и другие).






// MARK: Пример 1. Требования протоколов

//Создайте протокол FullyNamed, который декларирует свойство fullName и его тип данных String. Конструкция { get } обозначает, что свойство должно быть доступно для чтения.

protocol FullyNamed {
    var fullName: String { get }
}
//Протокол FullyNamed требует, чтобы любой тип, который будет ему соответствовать, должен  содержать свойство с названием fullName с типом String.

//Пример структуры, полностью соответствующей протоколу FullyNamed. Одинаковый синтаксис с наследованием классов:

struct Personi: FullyNamed {
    var fullName: String
}
//Если требования протокола не выполняются полностью, Swift показывает ошибку компиляции.

//Структура определяет свойства, описанные в протоколе, чтобы они соответствовали ему, но это не ограничивает тип в добавлении свойств, выходящих за рамки протокола.

//Например, можно определить структуру AnotherPerson и, помимо свойств fullName из протокола FullyNamed, добавить свойство birthDateString.

struct AnotherPerson: FullyNamed {
    var fullName: String
    var birthDateString: String
}




// MARK: Пример 2. Требования протоколов

//Создайте протокол SomeProtocol, в котором опишите два свойства: mustBeSettable типа Int, доступное для чтения и установки, а также doesNotNeedToBeSettable типа Int, доступное только для чтения.

protocol SomeProtocolr {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable : Int { get }
}
//Создайте структуру, соответствующую протоколу SomeProtocol.

struct SomeStructurer: SomeProtocolr {
    var mustBeSettable: Int
    var doesNotNeedToBeSettable: Int
}
//Подготовьте экземпляр структуры, указывая тип SomeProtocol, установите первоначальные значения свойств и затем попробуйте их изменить.

var someStructure: SomeProtocolr = SomeStructurer(mustBeSettable: 1, doesNotNeedToBeSettable: 2)
someStructure.mustBeSettable = 11
//someStructure.doesNotNeedToBeSettable = 22

//Cannot assign to property: 'doesNotNeedToBeSettable' is a get-only property
//При установке нового значения для doesNotNeedToBeSettable компилятор выдаст ошибку, так как это свойство get-only — доступно только для получения.




// MARK: Требования методов

//Протокол требует для определения не только свойства, но и методы.

//Описание методов содержит:

//ключевое слово func,
//название метода,
//необходимые параметры (опционально),
//возвращаемые параметры (опционально).
//Предварительные значения нельзя указать в протоколе для параметров, принимаемых методом.

//Описание метода может быть как без фигурных скобок, так и вовсе без тела метода.

// Пример 1
protocol SomeProtocolWithMethodd {
    func someMethod()
    func someMethodWithParam(param: Int)
    func someMethodWithParamAndReturnType(param: String) -> Double
}
//В этом примере описан протокол, включающий в себя три функции, которые отличаются по количеству и типу принимаемых и возвращаемых значений.

// Пример 2
protocol RandomNumberGeneratorr {
    func random() -> Double
}
//Во втором примере показан протокол с единственным требуемым методом экземпляра. Протокол RandomNumberGenerator требует, чтобы любой соответствующий ему тип содержал метод random, который возвращает значение типа Double. Такой протокол не задаёт способ  вычисления случайного числа, а просто требует реализовать описанный метод.

//Ниже показана реализация классов, которые соответствуют протоколу RandomNumberGenerator.

class GeneratorOne: RandomNumberGeneratorr {
    func random() -> Double {
        return Double.random(in: 1.0...100.0)
    }
}
class GeneratorTwo: RandomNumberGeneratorr {
    let a = 1.1
    let b = 2.2
    let c = 3.3
    let d = 4.4
    let e = 5.5
    func random() -> Double {
        let doubleArray: [Double] = [a, b, c, d, e]
        return doubleArray.randomElement() ?? 0
    }
}
//Класс GeneratorOne при использовании функции random() возвращает случайное число типа Double в диапазоне от 1.0 до 100.0.

//Класс GeneratorTwo при использовании функции random() возвращает случайное число из массива, который состоит из констант этого же класса.

//Обратите внимание: необходимо раскрыть опционал, когда функция randomElement() у массива возвращает опциональное значение, так как метод random() ожидает неопциональный тип в качестве возвращаемого значения.





// MARK: Требования инициализатора

//Помимо прочего, протоколы декларируют инициализаторы. Инициализатор — обязательный для потенциальных подклассов и обозначает ключевым словом required, которое показывает, что данный инициализатор пришёл из протокола:

protocol WithInitProtocoll {
    var someParameter: Int { get }
    init(_ someParameter: Int)
}
class SomeNewClass: WithInitProtocoll {
    var someParameter: Int
    required init(_ someParameter: Int) {
        self.someParameter = 22
    }
}
//Использование модификатора required гарантирует явную или унаследованную реализацию для требуемого инициализатора на всех подклассах соответствующего протоколу класса. Таким образом, инициализатор тоже будет соответствовать протоколу.

//Примечание: реализация инициализаторов протокола не обозначается модификатором required в классах с модификатором final, потому что у конечных классов нет подклассов.

//Протоколы используются с различными типами, но их использование можно ограничить до классов.

//Пример:
protocol OnlyForClass: AnyObject {
    // Определяет протокол типа class-only
}

//struct SomeStruct: OnlyForClass {}
// Ошибка! Non-class type 'SomeStruct' cannot conform to class protocol 'OnlyForClass'з





// MARK: Наследование протоколов

//Протокол наследует другие протоколы и добавляет к ним дополнительные требования. Причём типы данных могут соответствовать нескольким протоколам. Синтаксис наследования протокола аналогичен синтаксису наследования класса, но в протоколе есть возможность наследовать сразу несколько других протоколов, которые перечисляются через запятую:

// Первый протокол
protocol FirstProtocol {
    var number: Int { get }
}
// Второй протокол
protocol SecondProtocol {
    var count: Int { get }
}
// Протокол, который наследует другие протоколы
protocol CombinedProtocol: FirstProtocol, SecondProtocol {
    var name: String { get }
}
// Подписываемся на соблюдение нескольких протоколов
class ClassWithMultipleProtocols: FirstProtocol,SecondProtocol {
    var number: Int = 4
   var count: Int = 5
}
//Подписываемся на протокол, который наследует другие протоколы
class ClassWithCombinedProtocol: CombinedProtocol {
    var number: Int = 4
    var count: Int = 5
    var name: String = "test name"
}
//Ещё один вариант наследования протоколов — через ключевое слово typealias. Это псевдоним типа, предоставляемый языком Swift для определения собственного протокола. Таким же образом мы можем создать псевдоним пользовательского типа для объединения протоколов:

protocol AccessToFirstFloor {
    var workId: Int { get set }
}
protocol AccessToSecondFloor {}
typealias BuildingAccess = AccessToFirstFloor & AccessToSecondFloor
struct Employee: BuildingAccess {
    var workId: Int
    var name: String
}
//Так, компания Apple создаёт собственные протоколы с помощью typealias — например, Codable, который содержит одновременно протоколы Decodable и Encodable.

typealias Codable = Decodable & Encodable

//Наследование протоколов сокращает количество написанного кода, когда его нужно использовать в цикле с объектами разного типа:

//Опишите протокол, гарантирующий возвращение названий с помощью метода getName().

protocol NameProtocoll {
    // Метод, возвращающий имя сущности
    func getName() -> String
}
//Опишите структуры Car и Bird, соответствующие протоколу NameProtocol.
struct Carr: NameProtocoll {
    func getName() -> String {
        return "Car"
    }
    let numberOfWeels = 4
}
struct Birdd: NameProtocoll {
    func getName() -> String {
        return "Bird"
    }
    let color: String
}
//Создайте массив с элементами типа NameProtocol.

let arrayy: [NameProtocoll] = [Carr(), Birdd(color: "Green")]
//Обращаясь к элементам массива в цикле, можно использовать метод getName, описанный в протоколе.

arrayy.forEach { item in
    print(item.getName()) // Carr Birdd
}
//В этом примере обращение возможно только к свойствам или методам, описанным в протоколе. Нельзя, например, использовать свойство color у элемента массива. В данном случае осуществляется приведение типов:
print("hello")
arrayy.forEach { item in
    print(item.getName()) // Car Bird
    let maybeBird = item as? Birdd
    print(maybeBird?.color ?? 0) // nil Green
}
//Таким образом, две совершенно разные структуры объединены с помощью одного протокола.




// MARK: Использование протоколов

//В большинстве простых случаев Swift автоматически предоставляет соответствие таких протоколов, как Equatable, Hashable и Comparable. Использование синтезированной реализации означает, что для реализации требования кодов не нужно прописывать повторяющийся шаблонный код.

//Equatable используется для проверки типа на равенство его экземпляров (== и !=).

//Comparable используется для сравнения экземпляров типа (<=, <, >, >=).

//Swift предоставляет синтезированную реализацию протокола Equatable для следующих кастомных типов:

//Структуры только со свойством хранения, которые соответствуют протоколу Equatable.
//Перечисления только с ассоциативными типами, которые соответствуют протоколу Equatable.
//Перечисления без ассоциативных типов.
//Чтобы получить синтезированную реализацию оператора равенства ==, нужно объявить о соответствии протоколу Equatable в файле, который содержит оригинальное объявление без реализации оператора  ==. Протокол Equatable предоставит дефолтную реализацию оператора !=.

//Equatable:
//Опишите структуру

struct SomeStructures {
    let stringValue: String
    let intValue: Int
}
//Через расширение укажите соответствие структуры протоколу Equatable. Так Swift предоставит возможность проверять элементы структуры на равенство. Если не переопределять равенство и не указывать пользовательские условия, дефолтное равенство выполняется при равных парах элементов структуры.


//extension SomeStructures: Equatable {
//}
let struct1 = SomeStructures(stringValue: "One", intValue: 1)
let struct2 = SomeStructures(stringValue: "Two", intValue: 1)
struct1 == struct2 // false. т.к. структуры не равны
let struct11 = SomeStructures(stringValue: "One", intValue: 1)
let struct22 = SomeStructures(stringValue: "One", intValue: 1)
struct11 == struct22 // true. т.к. структуры равны
//Условия равенства можно изменить, прописав собственные.

//Для примера: обновите extension у SomeStructure и опишите функцию static func == (lhs: Self, rhs: Self) -> Bool.

//Где Self — это ваш тип, lhs — значение слева от знака равенства, rhs — значение слева от знака равенства.

//Допустим, в ваших условиях достаточно равенства intValue у экземпляров структур для того,  чтобы считать их равными друг другу.

extension SomeStructures: Equatable {
    static func == (lhs: SomeStructures, rhs: SomeStructures) -> Bool {
        return lhs.intValue == rhs.intValue
    }
}
//В результате обновления, ответом на новую проверку условия struct1 == struct2 будет true, так как кастомное условие равенства выполняется.

//Comparable:
//Через extension укажите соответствие вашего типа SomeStructure протоколу Comparable. Swift потребует описать функцию < (меньше) сравнения экземпляров для соответствия протоколу.

//В самой функции, как и в блоке выше, указаны условия, при которых экземпляр слева будет меньше экземпляра справа. К примеру, если количество символов (count) в stringValue экземпляра слева меньше, чем у параметра справа, — элемент слева меньше того, что справа.

 extension SomeStructures: Comparable {
    static func < (lhs: SomeStructures, rhs: SomeStructures) -> Bool {
        return lhs.stringValue.count < rhs.stringValue.count
    }
}
//Таким образом, можно добавлять уникальные способы сравнения экземпляров пользовательского типа, которые будут выполнять необходимые условия.

//Hashable:
//Swift предоставляет синтезированную реализацию протокола Hashable для следующих кастомных типов:

//Структуры только со свойствами хранения, которые соответствуют протоколу Hashable.
//Перечисления только с ассоциативными типами, которые соответствуют протоколу Hashable.
//Перечисления без ассоциативных типов.
//Для получения синтезированной реализации метода hash(into:), нужно объявить о соответствии протоколу Hashable в файле, который содержит оригинальное объявление без реализации метода hash(into:).

//Протокол Hashable используется для хранения словаря. Например, если структура соответствует протоколу Hashable, значит, экземпляры данной структуры можно использовать как ключ в словаре.

struct SomeHashableStructure: Hashable {
    let stringValue: String
    let intValue: Int
}
let structHash1 = SomeHashableStructure(stringValue: "One", intValue: 1)
let structHash2 = SomeHashableStructure(stringValue: "Two", intValue: 2)
//Создайте словарь, где ключ определяется структурой SomeHashableStructure и добавьте элементы, где structHash1 и structHash2 — это ключи.

let dictionaryt: [SomeHashableStructure: String] = [structHash1: "one", structHash2: "two"]
//Далее обращение к элементу словаря осуществляется по ключу.

print(dictionaryt[structHash1] ?? 0) // Optional("one")
//Дополнительно о протоколах можно почитать в официальной документации Swift.

//Вывод
//В этом материале вы повторили функционал протоколов и принципы их использования.

//С помощью этих наборов правил или деклараций вы можете создавать универсальные абстракции и затем использовать их в любом месте приложения, а также избежать дублирования кода.

//Для дополнительного изучения ознакомьтесь со статьёй «Swift. Протоколы».
