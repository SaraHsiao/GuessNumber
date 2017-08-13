//
//  ViewController.swift
//  GuessNumber
//
//  Created by KaFeiDou on 2017/8/13.
//  Copyright © 2017年 KaFeiDou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Properties
    @IBOutlet weak var lblRed: UILabel!
    @IBOutlet weak var lblOrange: UILabel!
    @IBOutlet weak var txtFedDisplay: UITextField!
    
    var answer = Int(arc4random_uniform(100) + 1)
    var minNumber = 1
    var maxNumber = 100
    var isOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set text in lblRed
        lblRed.text = "What's the number?"
        
        //Keyboard always display
        txtFedDisplay.becomeFirstResponder()
    }
    
    //Button for Guess
    @IBAction func btnGuess(_ sender: UIButton) {
        
        
        if (isOver == false) {
            print("The answers is： \(answer)")
            
            let inputTxt = txtFedDisplay.text!
            
            //clear TextField
            txtFedDisplay.text = ""
            
            //change String to Int
            let textNumber = Int(inputTxt)
            
            if (textNumber == nil) {
                lblOrange.text = "No input!Guess a number between \(minNumber)~\(maxNumber)"
            } else if (textNumber! < minNumber || textNumber! > maxNumber) {
                lblOrange.text = "Wrong!Guess a number between \(minNumber)~\(maxNumber)"
            } else if (textNumber == answer) {
                lblOrange.text = "BINGO✌️✌️Play again,pls press [GUESS]"
                isOver = true
            } else {
                if (textNumber! > answer) {
                    maxNumber = textNumber!
                } else {
                    minNumber = textNumber!
                }
                lblOrange.text = "Pls guess a number between \(minNumber)~\(maxNumber)"
            }
        } else {
            //if would like to play agian, need set all in org
            maxNumber = 100
            minNumber = 1
            lblOrange.text = "Pls guess a number between \(minNumber)~\(maxNumber)"
            answer = Int(arc4random_uniform(100) + 1)
            isOver = false
        }
    }
}
