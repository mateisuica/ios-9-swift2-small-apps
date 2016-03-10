//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var oddNumbers = [Int]()
var sums = [Int]()
for var x = 1; x <= 100; x = x + 2 {
    oddNumbers.append(x)
}

for odd in oddNumbers {
    sums.append(odd+5)
}
var i = 0
repeat {
    print("The sum is \(sums[i])");
    i++;
} while i<sums.count
