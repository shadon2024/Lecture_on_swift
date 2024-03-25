import UIKit

//    if sum1 > sum2 {
//        print("больше")
//    } else if sum1 < sum2 {
//        print("меньше")
//    } else {
//        print("больше")
//    }
//
//    if sum1 < sum2 {
//        print("меньше")
//    } else {
//        print("больше")
//    }


func summ(toValue: Int?)   {
    var sum = 1
    for name in 1...99 {
        if (name % 2) != 0   {
            sum +=  name
        } else {
            //print(name)
        }
        //print(name)
    }
    print(sum)
    return
}
summ(toValue: 100)
//let result: () = summ(toValue: 100)
//print(result)
