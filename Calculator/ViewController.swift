//
//  ViewController.swift
//  Calculator
//
//  Created by Matthew McClure on 6/14/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

//problems to work out: adding more than two numbers only adds the most recent addition to the last total and ignores all others in between;
//new problem where first two numbers after clearing or just starting out don't add together... but subsequent adds do...

import UIKit

class ViewController: UIViewController {
  
  var lastNumberEntered : Float = 0.0
  var firstNumberToCalculate : Float = 0.0
  var lastTotaled : Float = 0.0
  var displayedText = ""
  var userIsTyping : Bool = false
  var operationSymbol = ""
  var counter = 0
  
  @IBOutlet weak var display: UILabel!
  @IBOutlet weak var decimalKey: UIButton!
  @IBAction func decimalKeyPressed(sender: AnyObject) {
    display.text = display.text! + "."
    displayedText = display.text!
    decimalKey.enabled = false
  }
  
  @IBAction func digitPressed(sender: UIButton) {
    display.text = ""
    println("key was pressed")
    
    let digit = sender.currentTitle!
    println(digit)
    if userIsTyping {
      display.text = display.text! + digit
      displayedText = display.text!
    } else {
      display.text = digit
      displayedText = display.text!
      userIsTyping = true
      if counter == 0 {
      firstNumberToCalculate = NSNumberFormatter().numberFromString(digit)!.floatValue
        println("counter was zero")
      }
    }
  }
  
  func finishedEnteringLastNumber() {
    let numberFormatter = NSNumberFormatter()
    let number = numberFormatter.numberFromString("\(displayedText)")
    let convertedNumber = number!.floatValue
    lastNumberEntered = convertedNumber
    decimalKey.enabled = true
    display.text = ""
    println("Last number (that's been converted to a float) entered before operation button pressed: \(lastNumberEntered)")
  }
  
  @IBAction func operate(sender: UIButton) {
    let operation = sender.currentTitle!
    switch operation {
      case "÷": operationSymbol = "÷"
      println(operationSymbol)
//      case "×":
//      case "−":
    case "+": operationSymbol = "+"
    display.text = ""
    finishedEnteringLastNumber()
    //firstNumberToCalculate = lastNumberEntered
    lastNumberEntered = 0.0
    println(operationSymbol)
        default: finishedEnteringLastNumber()
    }
  }
  
  @IBAction func calculateThis(sender: AnyObject) {
    finishedEnteringLastNumber()
    switch operationSymbol {
      case "÷": println("divide")
//      case "×":
      //      case "−":
    case "+": let firstNumber = lastNumberEntered
    let secondNumber : Float = firstNumberToCalculate
    let sum : Float = firstNumber + secondNumber
    lastTotaled = sum
    println("Last totaled: \(lastTotaled)")
      display.text = lastTotaled.description
      firstNumberToCalculate = lastTotaled
    default: println("default case: do nothing")
    }
  }
  
  @IBAction func clearAll(sender: AnyObject) {
    display.text = "0"
    lastNumberEntered = 0.0
    lastTotaled = 0.0
    firstNumberToCalculate = 0.0
    println("cleared")
    counter++
    println(counter)
  }

}

