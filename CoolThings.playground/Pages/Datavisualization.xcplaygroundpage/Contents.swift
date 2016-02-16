//: # Data visualization
//: [Previous](@previous) | [Next](@next)

import UIKit

func f(x: Double) -> Double {
  let y = x/20
  return sin(y*y)
}

for i in 0...60 {
  f(Double(i))
}

func g(x: Double) -> Double {
  let y = x/10.0
  return 1/(1+y*y)
}

for i in -30...30 {
  g(Double(i))
}


func bubbleSort(numberList: Array<Int>) -> Array<Int> {
  
  //mutated copy
  var output = numberList
  
  for primaryIndex in 0..<numberList.count {
    
    let passes = (output.count - 1) - primaryIndex
    
    //half-open range operator
    for secondaryIndex in 0..<passes {
      
      output[secondaryIndex]
      let key = output[secondaryIndex]
      //compare positions
      if (key > output[secondaryIndex + 1]) {
        swap(&output[secondaryIndex], &output[secondaryIndex + 1])
      }
    }
  }
  return output
}

func insertionSort(numberList: Array<Int>) -> Array<Int> {
  
  //mutated copy
  var output = numberList
  
  for primaryIndex in 0..<output.count {
    
    let key = output[primaryIndex]
    
    for var secondaryIndex = primaryIndex; secondaryIndex > -1; secondaryIndex-- {
      
      //move into correct position
      if key < output[secondaryIndex] {
        
        output.removeAtIndex(secondaryIndex + 1)
        output.insert(key, atIndex: secondaryIndex)
      }
    }
  }
  
  return output
  
}


let array = [1, 2, 45, 5, 67, 20, 3, 4, 55, 123]
bubbleSort(array)
insertionSort(array)

//: [Previous](@previous) | [Next](@next)

