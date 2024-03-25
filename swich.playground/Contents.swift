import UIKit
import Foundation
import SwiftUI

let isNumberEqual10Closure: (Int) -> Void = { number in
    switch number {
    case 1:
        print("1: Январь")
    case 2:
        print("2: Февраль")
    case 3:
        print("3: Март")
    case 4:
        print("4: Апрель")
    case 5:
        print("5: Май")
    case 6:
        print("6: Июнь")
    case 7:
        print("7: Июль")
    case 8:
        print("8: Август")
    case 9:
        print("9: Сентябрь")
    case 10:
        print("10: Октябрь")
    case 11:
        print("11: Ноябрь")
    case 12:
        print("12: Декабрь")
    default:
        print("Такого месяца не бывает")
    }
}

func runArrayClosure(array: [Int], isNumberEqual10Closure: ([Int]) -> Void) {
    isNumberEqual10Closure (array)
}


runArrayClosure(array: []) { isNumberEqual10Closure in
    if isNumberEqual10Closure == [1] {
        isNumberEqual10Closure.forEach{ element in
            print("1: Январь")
        }
    } else  if isNumberEqual10Closure == [2] {
        isNumberEqual10Closure.forEach{ element in
            print("2: Февраль")
        }
    } else  if isNumberEqual10Closure == [3] {
        isNumberEqual10Closure.forEach{ element in
            print("3: Март")
        }
    } else  if isNumberEqual10Closure == [4] {
        isNumberEqual10Closure.forEach{ element in
            print("4: Апрель")
        }
    } else  if isNumberEqual10Closure == [5] {
        isNumberEqual10Closure.forEach{ element in
            print("5: Май")
        }
    } else  if isNumberEqual10Closure == [6] {
        isNumberEqual10Closure.forEach{ element in
            print("6: Июнь")
        }
    } else  if isNumberEqual10Closure == [7] {
        isNumberEqual10Closure.forEach{ element in
            print("7: Июль")
        }
    } else  if isNumberEqual10Closure == [8] {
        isNumberEqual10Closure.forEach{ element in
            print("8: Август")
        }
    } else  if isNumberEqual10Closure == [9] {
        isNumberEqual10Closure.forEach{ element in
            print("9: Сентябрь")
        }
    } else  if isNumberEqual10Closure == [10] {
        isNumberEqual10Closure.forEach{ element in
            print("10: Октябрь")
        }
    } else  if isNumberEqual10Closure == [11] {
        isNumberEqual10Closure.forEach{ element in
            print("11: Ноябрь")
        }
    } else  if isNumberEqual10Closure == [12] {
        isNumberEqual10Closure.forEach{ element in
            print("12: Декабрь")
        }
    } else {
        print("Месяцев нет")
    }
}

// test
// test
// test



//runArrayClosure(array: [1], isNumberEqual10Closure: isNumberEqual10Closure)
/*
 func runArrayClosure(array: [Int], closure: ([Int]) -> Void) {
     closure(array)
 }

 runArrayClosure(array: []) { array in
     if array.contains(1)  {
         array.forEach { item in
             if array == [1] {
                 print("1: Январь")
             }
         }
     } else if  array.contains(2)  {
         array.forEach { item in
             if array == [2] {
                 print("2: Февраль")
             }
         }
     } else if  array == [3] {
         array.forEach { item in
             if array == [3] {
                 print("3: Март")
             }
         }
     } else if  array == [4] {
         array.forEach { item in
             if array == [4] {
                 print("4: Апрель")
             }
         }
     } else if  array == [5] {
         array.forEach { item in
             if array == [5] {
                 print("5: Май")
             }
         }
     } else if  array == [6] {
         array.forEach { item in
             if array == [6] {
                 print("6: Июнь")
             }
         }
     } else if  array == [7] {
         array.forEach { item in
             if array == [7] {
                 print("7: Июль")
             }
         }
     } else if  array == [8] {
         array.forEach { item in
             if array == [8] {
                 print("8: Август")
             }
         }
     } else if  array == [9] {
         array.forEach { item in
             if array == [9] {
                 print("9: Сентябрь")
             }
         }
     } else if  array == [10] {
         array.forEach { item in
             if array == [10] {
                 print("10: Октябрь")
             }
         }
     } else if  array == [11] {
         array.forEach { item in
             if array == [11] {
                 print("11: Ноябрь")
             }
         }
     } else if  array == [12] {
         array.forEach { item in
             if array == [12] {
                 print("12: Декабрь")
             }
         }
     }else  {
         print("Месяцев нет")
     }
 }
 */


