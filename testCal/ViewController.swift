//
//  ViewController.swift
//  testCal
//
//  Created by Huy Hà on 7/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expessionLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    var runningNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = "0"
       
    }

    @IBAction func numberBtnPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            let temp = (sender.titleLabel?.text)!
            runningNumber = runningNumber + temp
            expessionLabel.text = runningNumber
        }

    }
    
    @IBAction func dotBtnPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7  {
            runningNumber = runningNumber + "."
            expessionLabel.text = runningNumber
        }
    }

    @IBAction func clearBtnPressedr(_ sender: RoundButton) {
        clearAll()
    }

    @IBAction func reverseBtnPressed(_ sender: RoundButton) {
        if runningNumber.count > 0 {
            runningNumber.removeLast()
            expessionLabel.text = runningNumber
        }
        
    }

    @IBAction func percentBtnPressed(_ sender: RoundButton) {
        runningNumber = runningNumber + "*0.01"
        expessionLabel.text = runningNumber
    }
    @IBAction func divideBtnPressed(_ sender: RoundButton) {
        runningNumber = runningNumber + "/"
        expessionLabel.text = runningNumber
    }

    @IBAction func multiBtnPressed(_ sender: RoundButton) {
        runningNumber = runningNumber + "*"
        expessionLabel.text = runningNumber
    }
    @IBAction func minusBtnPressed(_ sender: RoundButton) {
        runningNumber = runningNumber + "-"
        expessionLabel.text = runningNumber
    }
    @IBAction func plusButtonPressed(_ sender: RoundButton) {
        runningNumber = runningNumber + "+"
        expessionLabel.text = runningNumber
    }
    @IBAction func equalButtonPressed(_ sender: RoundButton) {
        if(runningNumber == "") { outputLabel.text = "0"}
        else {
            if( validInput()) {
                let mathExpression = NSExpression(format: runningNumber)
                let mathValue = mathExpression.expressionValue(with: nil, context: nil) as! Double
                let resutlString = formatResult(result: mathValue)
                outputLabel.text = resutlString
            }
        }
        
    }
    
    func clearAll () {
        runningNumber = ""
        outputLabel.text = "0"
        expessionLabel.text = ""
    }
    func specialCharacter (char: Character) -> Bool
        {
            if(char == "*")
            {
                return true
            }
            if(char == "/")
            {
                return true
            }
            if(char == "+")
            {
                return true
            }
            return false
        }
    func validInput() ->Bool
        {
            var count = 0
            var funcCharIndexes = [Int]()
            
            for char in runningNumber
            {
                if(specialCharacter(char: char))
                {
                    funcCharIndexes.append(count)
                }
                count += 1
            }
            
            var previous: Int = -1
            
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                
                if(index == runningNumber.count - 1)
                {
                    return false
                }
                
                if (previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }
                previous = index
            }
            
            return true
        }
    func formatResult(result: Double) -> String {
            return String(format: "%.2f", result)
    }
   

}
