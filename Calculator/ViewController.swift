//
//  ViewController.swift
//  Calculator
//
//  Created by Matthew McClure on 6/14/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var display: UILabel!
  
  var userIsTyping : Bool = false
  
  @IBAction func digitPressed(sender: UIButton) {
    let digit = sender.currentTitle!
    if userIsTyping {
      display.text = display.text! + digit
    } else {
      display.text = digit
      userIsTyping = true
    }
  }
  
  override func viewDidLoad() {

  }
}

