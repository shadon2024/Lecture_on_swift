import UIKit
import Foundation
import SwiftUI

var greeting = "Hello, playground"

var temperaturCold = 25

var temperaturNorm = 40

var tempetaturHot = 75





//temperaturCold = 25
//if temperaturCold <= 24 {
//    print("It's very cold")
//} else {
//    print("It's not very cold")
//}

//temperaturCold = 60
//if temperaturCold <= 30 {
//    print("It's very cold")
//} else if temperaturCold >= 50 {
//    print("It's very very hot!")
//} else {
//    print("It's not cold")
//}

//temperaturCold = 40
//if temperaturCold <= 30 {
//    print("It's very cold!")
//} else if temperaturCold >= 50  {
//    print("It's very very hot!")
//}

let temperaturCol = 30
let weather: String
if temperaturCol <= 0 {
    weather = "It's very cold!"
} else if temperaturCol >= 30  {
    weather = "It's very hot!"
} else {
    weather = "It's norm!"
}
//print(weather)


//var weather: String? =  if temperaturCol <= 0 {
//    print("It's very cold")
//} else if temperaturCol >= 30 {
//    print("It's very hot")
//} else {
//    print("It's norm")
//}

//let someCharacter: Character = "s"
//switch someCharacter {
//case "a":
//    print("Alphabet")
//case "h":
//    print("Home")
//case "z":
//    print("Zorro")
//case "s":
//    print("Shodan group ltd")
//default:
//    print("sorry it's not find")
//}

//let someCharacter: Character = "s"
//var kas = someCharacter
// switch kas {
//case "a":
//    print("Alphabet")
//case "h":
//    print("Home")
//case "z":
//    print("Zorro")
//case "s":
//    print("Shodan group ltd")
//default:
//    print("sorry it's not find")
//}

//let somCharacer: Character = "Z"
//switch somCharacer {
//case "s","S":
//    print("Shodan")
//case "a","A":
//    print("Alif")
//case "z","Z":
//    print("Zorro")
//default:
//    print("it's not find")
//}

//let someWeekDay:Double = 0.8
//switch someWeekDay {
//case 01:
//    print("January 2024")
//case 02:
//    print("February 2024")
//case 03:
//    print("March 2024")
//case 04:
//    print("April 2024")
//case 05:
//    print("May 2024")
//case 06:
//    print("June 2024")
//case 07:
//    print("July 2024")
//case 08, 0.8:
//    print("August 2024")
//case 09, 0.9:
//    print("September 2024")
//case 10:
//    print("October 2024")
//case 11:
//    print("November 2024")
//case 12:
//    print("December 2024")
//default:
//    print("SORRY! it's not found!")
//}


let ofRepupliCountry = 4
let teritoty = " teritory"
let country: String
switch ofRepupliCountry {
case 0:
    country = "netrial zona"
case 1..<5:
    country = "Tajikistan"
case 5..<10:
    country = "Kirgizistan"
case 10..<15:
    country = "Uzbekistan"
case 15..<20:
    country = "Afhganistan"
default:
    country = " Sorry it's not find country"
}
print("It's of Republic \(country)\(teritoty)")

// кортежы


































