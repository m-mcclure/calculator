//
//  ViewController.swift
//  Calculator
//
//  Created by Matthew McClure on 6/14/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var lastNumberEntered : Float = 0.0
  var firstNumberToCalculate : Float = 0.0
  var total : Float = 0.0
  var displayedText = ""
  var userIsTyping : Bool = false
  var operationSymbol = ""
  @IBOutlet weak var display: UILabel!
  @IBOutlet weak var decimalKey: UIButton!
  @IBAction func decimalKeyPressed(sender: AnyObject) {
    display.text = display.text! + "."
    displayedText = display.text!
    decimalKey.enabled = false
    println("dec disabled")
  }
  
  @IBAction func digitPressed(sender: UIButton) {
    let digit = sender.currentTitle!
    if userIsTyping {
      display.text = display.text! + digit
      displayedText = display.text!
    } else {
      display.text = digit
      displayedText = display.text!
      userIsTyping = true
    }
  }
  
  func finishedEnteringLastNumber() {
    let numberFormatter = NSNumberFormatter()
    let number = numberFormatter.numberFromString("\(displayedText)")
    let convertedNumber = number!.floatValue
    lastNumberEntered = convertedNumber
    decimalKey.enabled = true
    display.text = ""
    println(lastNumberEntered)
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
    firstNumberToCalculate = lastNumberEntered
    lastNumberEntered = 0.0
    println(operationSymbol)
        default: finishedEnteringLastNumber()
    }
  }
//  
//  func display(){
//    display.text =
//  }
  
  @IBAction func calculateThis(sender: AnyObject) {
    finishedEnteringLastNumber()
    switch operationSymbol {
      case "÷": println("divide")
//      case "×":
      //      case "−":
    case "+": let firstNumber = firstNumberToCalculate
    let secondNumber : Float = lastNumberEntered
    let sum : Float = firstNumber + secondNumber
    println(sum)
      display.text = sum.description
    default: println("do nothing")
    }
    
  }
  
  
  @IBAction func clearAll(sender: AnyObject) {
    display.text = "0"
    println("umm")
  }
  override func viewDidLoad() {

  }
}

