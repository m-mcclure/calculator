
//  ViewController.swift
//  Calculator
//
//  Created by Matthew McClure on 6/14/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

//problems to work out: adding more than two numbers only adds the most recent addition to the last total and ignores all others in between;
//new problem where first two numbers after clearing or just starting out don't add together... but subsequent adds do...

import UIKit
import Darwin

class ViewController: UIViewController {
  
  var lastNumberEntered : Double = 0.0
  var firstNumberToCalculate : Double = 0.0
  var lastTotaled : Double = 0.0
  var displayedText = ""
  var userIsTyping : Bool = false
  var enterHasBeenPressed : Bool = false
  var clearHasBeenPressed : Bool = false
  var operationSymbol = ""
  var counter = 0
  
  @IBOutlet weak var display: UILabel!
  @IBOutlet weak var decimalKey: UIButton!
  
  //prevents decimal point from being used more than once per number
  @IBAction func decimalKeyPressed(sender: AnyObject) {
    display.text = display.text! + "."
    displayedText = display.text!
    decimalKey.enabled = false
  }
  
  @IBAction func digitPressed(sender: UIButton) {
    let digit = sender.currentTitle!
    
    if userIsTyping {
      
      if display.text == "0" {
        display.text = digit
        displayedText = display.text!
        convertThisNumber(displayedText)
      } else {
        
        display.text = display.text! + digit
        displayedText = display.text!
        convertThisNumber(displayedText)
      }
    } else {
      
      display.text = digit
      displayedText = display.text!
      userIsTyping = true
      convertThisNumber(displayedText)
    }
  }
  
  func convertThisNumber(stringNum: NSString) -> Double {
    let numberFormatter = NSNumberFormatter()
    let number = numberFormatter.numberFromString("\(stringNum)")
    let convertedNumber = number!.doubleValue
    println(convertedNumber)
    return convertedNumber
  }
  
  func finishedEnteringLastNumber() -> Double {
    let numberFormatter = NSNumberFormatter()
    let number = numberFormatter.numberFromString("\(displayedText)")
    let convertedNumber = number!.doubleValue
    lastNumberEntered = convertedNumber
    decimalKey.enabled = true
    display.text = ""
    return lastNumberEntered
  }
  
  @IBAction func operate(sender: UIButton) {
    let operation = sender.currentTitle!
    switch operation {
    case "÷": operationSymbol = "÷"
    display.text = ""
    finishedEnteringLastNumber()
    println("Last num befo + sign hit: \(lastNumberEntered)")
    if enterHasBeenPressed {
      firstNumberToCalculate = lastTotaled
    } else {
      firstNumberToCalculate = lastNumberEntered
    }
    println(operationSymbol)
    case "×": operationSymbol = "×"
    display.text = ""
    finishedEnteringLastNumber()
    println("Last num befo x sign hit: \(lastNumberEntered)")
    if enterHasBeenPressed {
      firstNumberToCalculate = lastTotaled
    } else {
      firstNumberToCalculate = lastNumberEntered
    }
    println(operationSymbol)
      
    case "−": operationSymbol = "−"
    display.text = ""
    finishedEnteringLastNumber()
    println("Last num befo + sign hit: \(lastNumberEntered)")
    if enterHasBeenPressed {
      firstNumberToCalculate = lastTotaled
    } else {
      firstNumberToCalculate = lastNumberEntered
    }
    println(operationSymbol)
      
    case "+": operationSymbol = "+"
    display.text = ""
    finishedEnteringLastNumber()
    println("Last num befo + sign hit: \(lastNumberEntered)")
    if enterHasBeenPressed {
      firstNumberToCalculate = lastTotaled
    } else {
      firstNumberToCalculate = lastNumberEntered
    }
    println(operationSymbol)
      
    default: finishedEnteringLastNumber()
    }
  }
  
  @IBAction func percentage(sender: AnyObject) {
    println(display.text)
    let stringToConvert : NSString = display.text!
    let convertedString = (stringToConvert as NSString).doubleValue
    println(convertedString)
    let percentage = convertedString / 100.0
    displayedText = "\(percentage)"
    display.text = "\(percentage)"
  }
  
  
  @IBAction func calculateThis(sender: AnyObject) {
    finishedEnteringLastNumber()
    enterHasBeenPressed = true
    
    switch operationSymbol {
      
    case "÷": println("divide")
    let firstNumber = lastNumberEntered
    let secondNumber : Double = firstNumberToCalculate
    let quotient : Double = secondNumber / firstNumber
    lastTotaled = quotient
    println("Last totaled: \(lastTotaled)")
    display.text = lastTotaled.description
      
    case "×": let firstNumber = lastNumberEntered
    let secondNumber : Double = firstNumberToCalculate
    let product : Double = secondNumber * firstNumber
    lastTotaled = product
    println("Last totaled: \(lastTotaled)")
    display.text = lastTotaled.description
    case "−": let firstNumber = lastNumberEntered
    let secondNumber : Double = firstNumberToCalculate
    let difference : Double = secondNumber - firstNumber
    lastTotaled = difference
    println("Last totaled: \(lastTotaled)")
    display.text = lastTotaled.description
    case "+": let firstNumber = lastNumberEntered
    let secondNumber : Double = firstNumberToCalculate
    let sum : Double = firstNumber + secondNumber
    lastTotaled = sum
    println("Last totaled: \(lastTotaled)")
    display.text = lastTotaled.description
      
    default: println("default case: do nothing")
    }
    firstNumberToCalculate = lastTotaled
  }
  
  @IBAction func clearAll(sender: AnyObject) {
    display.text = "0"
    lastNumberEntered = 0.0
    lastTotaled = 0.0
    firstNumberToCalculate = 0.0
    println("cleared")
    enterHasBeenPressed = false
    clearHasBeenPressed = true
  }
}
