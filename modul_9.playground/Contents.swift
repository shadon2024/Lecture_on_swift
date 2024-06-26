import UIKit

//
// ООП
//
//
//Описание
//В этом модуле вы познакомитесь с такой парадигмой программирования, как объектно ориентированное программирование (ООП).
//
//Вам предстоит изучить принципы ООП:
//
//наследование,
//полиморфизм,
//инкапсуляцию.
//Также вы познакомитесь с тем, как применять данные принципы в своём коде, и научитесь работать с кодом, написанным с применением подхода ООП.
//
//В ходе практики вам предстоит реализовать свой унаследованный от ViewController класс, научиться переопределять методы и ближе познакомиться с модификаторами доступа.


//9.2 Введение в объектно-ориентированное программирование
//О чём пойдёт речь
//Узнаем, что такое объектно-ориентированное программирование (ООП), для чего оно используется и какие принципы ООП выделяют.


//Объекты и классы
//Объектно-ориентированное программирование (ООП) основано на работе с объектами. Освежим в памяти понятия объекта и класса: рассмотрим оба термина на примере.
//
//Возьмём компьютерную игру — симулятор фермы, в котором игрок сажает растения и собирает урожай. Рассмотрим простой вариант игры. У нас есть несколько полей, в которых мы можем высаживать, допустим, помидоры. Когда игрок выбирает пустую клетку и выбирает «помидор», клетка заполняется ростком. Через некоторое время на ростке появляются плоды. После этого можно ещё раз тапнуть по клетке, тогда поле освобождается для новых растений, а игроку начисляется какое-то количество собранного урожая.

//Для начала напишем отдельный класс, который будет отвечать за рост помидора. В этом классе нам будут нужны функции для смены состояния: семечко, росток, растение с плодами и созревший плод. Для состояний будет удобнее создать перечисление (enum) и отдельную переменную под него в классе Tomato. Ещё нам пригодится переменная, хранящая время посадки. Она нужна, чтобы проверять, пора ли сменить состояние.

enum State: String {
    case seed = "Семечко"
    case growing = "Растущий"
    case needWatering = "Требует полива"
    case ripen = "Созревший"
    case harvested = "Урожай собран"
}

class Tomato {
    var plantedTime: Date!
    var state = State.seed
    
    // Функция для проверки состояния, пока плоды зреют. Функция будет вызываться периодически в автоматическом режиме
     func changeState() {
         let currentTime = Date()
         let interval = currentTime.timeIntervalSince(plantedTime)
        if interval > 10 && state == .growing {
             state = .ripen
             animate()
         }
    }

     // Функция вызывается, когда пользователь высаживает растение
     func plant() {
         if state == .seed {
             state = .growing
             plantedTime = Date()
             animate()
            // Здесь уменьшим количество плодов на складе, так как один из них используем для семян
        }
    }

    // Функция вызывается, когда пользователь собирает урожай
     func harvest() {
         if state == .ripen {
             state = .harvested
             animate()
            // Здесь нужно добавить на склад собранный урожай
        }
    }

    // Анимация смены статуса
     func animate() {
        // Здесь будем проверять статус и вызывать подходящую анимацию. Пока просто выведем сообщение об этом в лог
     print("Анимация для томата в состоянии \(state)")
   }
}

//Теперь, чтобы посадить помидор, нужно создать новый объект класса Tomato и вызвать его функцию plant(). У каждого отдельного растения будут свои свойства: состояние, дата посадки. Эти растения — объекты. При этом «поведение» объектов будет сходным, так как оно описано в методах класса. Таким образом, класс — это описание того, какими свойствами и поведением обладает объект. А объект — это отдельный экземпляр класса с собственным уникальным состоянием этих свойств.


class newTomato {
    var plantedTime: Date!
    var state = State.seed
    
    func plant() {
        if state == .seed {
            state = .growing
            plantedTime = Date()
            //animate()
           // Здесь уменьшим количество плодов на складе, так как один из них используем для семян
       }
   }
}



//Абстракция
//
//Выделение общих свойств и общего поведения в классы в ООП обычно называют абстракцией. Если обобщить, то абстракция — возможность выделить некоторые важные особенности физических объектов и на их основе описать модель.
//
//В примере выше мы определили, что в игре нас интересует возможность посадить растение, увидеть, как оно вырастет, и собрать урожай. Поэтому выделили и описали именно эту часть жизни растения, создали соответствующие состояния, а также функции, которые будут переводить томат из одного состояния в следующее. Функции plant() и harvest() будут вызываться по действию пользователя: посадить семечко и собрать урожай с куста с плодами. Функция changeState() будет вызываться по внешнему таймеру и сработает через 10 секунд после посадки, автоматически изменив состояние с growing (росток) на ripen (урожай созрел). Это и есть абстракция на практике.
//
//Очевидно, что абстракция присуща не только ООП, но и программированию в целом. Однако иногда её выделяют как отдельный принцип ООП. Принято выделять три основных принципа: наследование, полиморфизм и инкапсуляция. Далее вы узнаете о них подробнее. Если на собеседовании вас спросят о четвёртом принципе, то это и есть абстракция.



//
//Сложности программирования без ООП
//
//Пока что мы воспользовались только малой частью ООП, которая относится к программированию вообще. Посмотрим на остальные возможности и преимущества этого подхода.
//
//Сейчас наша игра довольно скучная. Исправим это, добавив в неё новые культуры — картофель и огурцы. С первого взгляда кажется, что проще скопировать класс Tomato и заменить в нём функцию, отвечающую за анимацию. Так у нас появятся два новых класса: Potato и Cucumber.



class Cucumber {
    var plantedTime: Date!
    var state = State.seed
    
    // Функция для проверки состояния, пока плоды зреют. Функция будет вызываться периодически в автоматическом режиме
    func changeState() {
        let currentTime = Date()
        let interval = currentTime.timeIntervalSince(plantedTime)
        if interval > 10 && state == .growing {
            state = .ripen
            animate()
        }
    }
    
    // Функция вызывается, когда пользователь высаживает растение
    func plant() {
        if state == .seed {
            state = .growing
            plantedTime = Date()
            animate()
            // Здесь уменьшим количество плодов на складе, так как один из них используем для семян
        }
    }
    
    // Функция вызывается, когда пользователь собирает урожай
    func harvest() {
        if state == .ripen {
            state = .harvested
            animate()
            // Здесь нужно добавить на склад собранный урожай
        }
    }
    
    // Анимация смены статуса
    func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для огурца в состоянии \(state)")
    }
}
class Potato {
    var plantedTime: Date!
    var state = State.seed
    
    // Функция для проверки состояния, пока плоды зреют. Функция будет вызываться периодически в автоматическом режиме
    func changeState() {
        let currentTime = Date()
        let interval = currentTime.timeIntervalSince(plantedTime)
        if interval > 10 && state == .growing {
            state = .ripen
            animate()
        }
    }
    
    // Функция вызывается, когда пользователь высаживает растение
    func plant() {
        if state == .seed {
            state = .growing
            plantedTime = Date()
            animate()
            // Здесь уменьшим количество плодов на складе, так как один из них используем для семян
        }
    }
    
    // Функция вызывается, когда пользователь собирает урожай
    func harvest() {
        if state == .ripen {
            state = .harvested
            animate()
            // Здесь нужно добавить на склад собранный урожай
        }
    }
    
    // Анимация смены статуса
    func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для картофеля в состоянии \(state)")
    }
}


//Теперь появились три почти одинаковых класса для разных растений. Давайте внесём в игру дополнительные возможности. Добавим состояние needWatering, когда наши растения будут требовать полива, а также соответствующее действие пользователя. Теперь придётся вносить изменения сразу в три класса.
//
//Но ведь в реальных программах растений может быть не три вида, а несколько десятков. Изменения придётся вносить в гораздо большее количество мест. С усложнением логики объём работы, а вместе с ним и количество ошибок будут расти. Чтобы облегчить расширение проекта и его поддержку, и было придумано ООП.




//Наследование и полиморфизм
//
//Оптимизируем код и упростим его поддержку, собирая всю повторяющуюся логику в одном классе. Назовём его классом-предком. Его наследники — это классы, в которых родительские функции и свойства не указаны явно, но ими можно пользоваться точно так же, как и в предке.



enum Statee: String {
    case seed = "Семечко"
    case growing = "Растущий"
    case needWatering = "Требует полива"
    case ripen = "Созревший"
    case harvested = "Урожай собран"
}
class Plantt {
    var plantedTime: Date!
    var state = State.seed
  
    
    // Функция для проверки состояния, пока плоды зреют. Функция будет вызываться периодически в автоматическом режиме
    func changeState() {
        let currentTime = Date()
        let interval = currentTime.timeIntervalSince(plantedTime)
        if interval > 10 && state == .growing {
            state = .needWatering
            animate()
        }
    }
    
    // Функция вызывается, когда пользователь высаживает растение
    func plant() {
        if state == .seed {
            state = .growing
            plantedTime = Date()
            animate()
            // Здесь уменьшим количество плодов на складе, так как один из них используем для семян
        }
    }
    
    // Функция вызывается, когда пользователь собирает урожай
    func harvest() {
        if state == .ripen {
            state = .harvested
            animate()
            // Здесь нужно добавить на склад собранный урожай
        }
    }
    
    // Функция вызывается, когда пользователь поливает растение
    func water() {
        if state == .needWatering {
            state = .ripen
            animate()
            // Здесь нужно добавить на склад собранный урожай
        }
    }
    
    // Анимация смены статуса
    func animate() {
        
    }
}
class Tomatoo: Plantt {
    
    override func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для томата в состоянии \(state)")
    }
}
class Cucumberr: Plantt {
    
    override func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для огурца в состоянии \(state)")
    }
}
class Potatoo: Plantt {
    
    override func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для картофеля в состоянии \(state)")
    }
}


//Мы просмотрели код исходных трёх классов и выяснили, что для всех трёх растений логика будет отличаться только в отрисовке отдельных растений в каждом из состояний. Поэтому весь код, кроме функции animate(), перенесли в родительский класс, а в наследниках оставили единственную функцию. В дальнейшем, если нужно описывать поведение, общее для всех растений, будем использовать родительский класс. Уникальные же для каждого из растений свойства правильнее выносить в классы-наследники.
//
//Теперь, чтобы добавить логику, нам не нужно дублировать её во всех наследниках. Достаточно один раз описать её в родителе. Этот механизм называют наследованием. Это первый принцип ООП.
//
//Теперь посмотрим внимательно на функцию animate(). В классе Plant она осталась пустой, а действия в ней описаны только для наследников. Нам нужна разная анимация для разных растений, поэтому реализацию мы в каждом классе оставили свою. Возможность использовать разные реализации для одной и той же функции называют полиморфизмом. И это второй принцип ООП.
//
//Обратите внимание, что функции, которые переопределяются в дочерних классах, нужно помечать специальным ключевым словом override.



//
//Инкапсуляция
//
//Поговорим о третьем принципе — инкапсуляции. Этот принцип гарантирует возможность настраивать правила доступа к отдельным полям и методам класса. Представьте, что поддержку проекта передали человеку, который ещё не успел познакомиться с кодом. Допустим, ему нужно настроить изменение состояния по таймеру. Мы уже знаем, что за это отвечают отдельные функции, которые рассчитаны либо на действие пользователя, либо на определённое время по таймеру. Но новый сотрудник может попытаться изменить состояние вручную, изменяя переменную state. Тогда логика изменений не будет соблюдена. Например, не вызовется анимация.
//
//Чтобы избежать этого, можно воспользоваться инкапсуляцией и ограничить доступ к переменной state только работой внутри класса. Используем ключевое слово private при определении переменной.

private var state = State1.seed

//Теперь при попытке обратиться к этой переменной вне класса Plant мы получим ошибку доступа. Можем посмотреть, как это работает в отладочной печати в функциях animate(). Чтобы оставить возможность прочитать данные о состоянии, можем сделать отдельный метод-геттер (от английского get — «получать»), который будет возвращать состояние. Однако изменить его он не позволит.


enum State1: String {
    case seed = "Семечко"
    case growing = "Растущий"
    case needWatering = "Требует полива"
    case ripen = "Созревший"
    case harvested = "Урожай собран"
}
class Plant1 {
    var plantedTime: Date!
    private var state = State1.seed
    var needWatering = false
//<...>
    
    func getState() -> State1 {
        return state
    }
}
class Tomato1: Plant1 {
    
    //override func animate() {
     func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для томата в состоянии \(getState())")
    }
}
class Cucumber1: Plant1 {
    
    //override func animate() {
     func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для огурца в состоянии \(getState())")
    }
}
class Potato1: Plant1 {
    
    //override func animate() {
     func animate() {
        // Проверяем статус и вызываем подходящую анимацию
        print("Анимация для картофеля в состоянии \(getState())")
    }
}



//Таким образом мы закрыли возможность изменить состояние напрямую и оградили код от неправильного использования.
//
//Помимо модификатора private существует ещё несколько модификаторов видимости. Чаще всего используют следующие:
//
//public — доступность во всём коде;
//fileprivate — видимость ограничена только тем файлом, в котором описана функция.
//Все эти модификаторы, включая private, одинаково работают и с функциями, и с переменными.



//Таким образом мы закрыли возможность изменить состояние напрямую и оградили код от неправильного использования.
//
//Помимо модификатора private существует ещё несколько модификаторов видимости. Чаще всего используют следующие:
//
//public — доступность во всём коде;
//fileprivate — видимость ограничена только тем файлом, в котором описана функция.
//Все эти модификаторы, включая private, одинаково работают и с функциями, и с переменными.


//Заключение
//Объектно-ориентированное программирование — один из наиболее востребованных подходов на рынке разработки. Многие современные языки программирования (Swift, Python, Java, C# и другие) спроектированы для поддержки именно ООП. Такие языки называют объектно-ориентированными языками.

//Парадигма ООП хорошо показала себя в больших проектах, где важна скорость и простота изменений кода, лёгкость поддержки и читабельность. Её достоинства компенсируют дополнительные затраты на проектирование и написание разветвлённой структуры на старте разработки. Неудивительно, что вопросы по ООП очень часто задают при приёме на работу.

//В этом разделе вы разобрали принципы ООП и увидели, как их используют. В практической работе в конце модуля будет возможность применить знания на практике. Удачи!



///
/// 9.3 ООП
//
//Объектно-ориентированное программирование (ООП) — представление программы в виде
//объектов и взаимоотношений между ними.
//Объект — что-то, что имеет своё состояние и поведение: мобильный телефон, компьютер, дерево,
//ручка для письма и т. д.
//Парадигма — способ мышления, способ восприятия.


//Принципы ООП
//Основные принципы ООП:
//● наследование
//● полиморфизм
//● инкапсуляция
//Мы рассматриваем ООП на примерах классов Swift.





///9.4 Наследование
///
///
//Наследование
//Наследование — это механизм, который позволяет наследовать одними классами свойства
//и поведение других классов для дальнейшего расширения или модификации.
//Класс, который взят за основу, называют: базовым, родительским, предком или суперклассом.
//Класс на его основе называют: потомком, наследником, дочерним или производным классом.
//Производный класс обладает теми же свойствами, что и базовый класс, а также может иметь свои
//собственные поля и функции.


//Наследование
//В iOS используются нативные библиотеки,
//использующие свойства ООП.
//Например, в UIKit есть класс UIButton.
//Справа показана иерархия наследования.



///
///
///9.5 Полиморфизм
///
//Полиморфизм — свойство, позволяющее иметь множество реализаций одного интерфейса.
//Позволяет вызовом переопределенного метода через переменную класса-родителя получить
//поведение, которое будет соответствовать реальному классу-потомку, на который ссылается
//эта переменная.
//Полиморфизм неразрывно связан с наследованием, которое помогает его реализовать.


//Пример
//Чтобы создать свой ViewController,
//мы наследуемся от класса UIViewController
//и переопределяем метод viewDidLoad().


//override func viewDidLoad() {
//    someLabel.text = "Update Text!"
//    someButton.backgroundColor = UIColor.red
//    if shouldHideView {
//        someView.isHidden =   true
//    }
//}





// 9.6 Инкапсуляция
//
//Описание
//Уровни доступа
//В Swift есть пять уровней доступа:

//open и public. Эти уровни доступа позволяет использовать объекты внутри любого исходного файла из определяющего их модуля и также в любом исходном файле из другого модуля, который импортирует определяющий модуль. Вы обычно используете открытый и публичный доступы, когда указываете общий интерфейс фреймворка.
//internal. Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из их определяющего модуля, но не внутри исходного файла другого модуля. Вы обычно указываете внутренний доступ, когда определяете внутреннюю структуру приложения или фреймворка.
//file-private. Этот уровень доступа позволяет использовать объект в пределах его исходного файла. Используйте файл с частным уровнем доступа, чтобы спрятать детали реализации определённой части функциональности, когда эти части функциональности будут использоваться внутри другого файла.
//private. Этот уровень доступа позволяет использовать сущность только в пределах области её реализации. Используйте частный доступ, чтобы спрятать детали реализации конкретной части функциональности, когда они используются только внутри области объявления.
//Прочитать подробнее про уровни доступа можно на странице Access Control руководства по языку от Swift.



//Инкапсуляция
//Инкапсуляция — свойство системы,
//позволяющее объединить данные и методы,
//работающие с ними в классе, и скрыть детали
//реализации от пользователя.
//
//Инкапсуляция
//Есть две трактовки этого свойства:
//● с одной стороны — это механизм языка,
//позволяющий ограничить доступ одних
//компонентов программы к другим
//● с другой — языковая конструкция,
//позволяющая связать данные с методами,
//предназначенными для обработки
//этих данных
//
//Инкапсуляция
//Для чего нужна инкапсуляция:
//● скрыть от пользователя детали реализации класса
//● предоставить определённые интерфейсы для взаимодействия с классом
//Это обеспечивает:
//● упрощение использования кодовой базы, так как доступны только те методы и свойства, которые
//действительно нужны
//● упрощение поддержки кодовой базы. Заранее известно, как устроен код внутри, где искать
//нужные свойства и методы
//
//Итоги модуля
//● Познакомились с ООП
//● Разобрались, как работать с ООП-библиотеками
//● Узнали, как создавать свой ViewController




//Модифицируйте игру «Ферма» из материала «Введение в объектно-ориентированное программирование».
//
//Добавьте в родительский класс Plant переменную name, которая будет хранить в себе название растения. В классах-наследниках добавьте инициализаторы, в которых будет задаваться значение переменной name.
//Добавьте вычисляемое свойство ageMillis, которое будет выводить разность между текущим временем и временем посадки в миллисекундах.
//Добавьте ещё одно состояние needFertilizer, в которое нужно будет переключаться случайным образом после полива. Добавьте функцию fertilize, которая по нажатию будет переводить растение в зрелое состояние (ripen). Для вычисления необходимости переключения в новое состояние используйте случайное значение Bool (Bool.random()).
//Добавьте класс Field (поле), в которое будем высаживать растение и обрабатывать действия пользователя.
//
//В классе создайте переменную plant, которая будет хранить высаженное растение.
//Добавьте в новый класс функцию onTap(), которая в зависимости от состояния поля и растения на нём будет либо создавать новое растение на поле (пока класс растения можно выбрать случайным образом), либо, если растение на поле уже высажено, вызывать функцию из класса Plant, подходящую к текущему состоянию растения. Пока в игре не реализован таймер, добавьте в обработчик и вызовы changeState().
//Создайте программу, которая будет имитировать игру. Создайте объект поля. Запустите цикл из N итераций, в рамках каждой из которых будет вызываться функция onTap(), чтобы растение на поле прошло стадии от посадки до сбора урожая.
