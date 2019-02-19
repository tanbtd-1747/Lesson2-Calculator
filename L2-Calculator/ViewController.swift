//
//  ViewController.swift
//  L2-Calculator
//
//  Created by tran.duc.tan on 2/19/19.
//  Copyright © 2019 tran.duc.tanb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    @IBOutlet var buttonZero: UIButton!         // Button tag: 0
    @IBOutlet var buttonDot: UIButton!          // Button tag: 10
    @IBOutlet var buttonEqual: UIButton!        // Button tag: 18
    @IBOutlet var buttonOne: UIButton!          // Button tag: 1
    @IBOutlet var buttonTwo: UIButton!          // Button tag: 2
    @IBOutlet var buttonThree: UIButton!        // Button tag: 3
    @IBOutlet var buttonAdd: UIButton!          // Button tag: 14
    @IBOutlet var buttonFour: UIButton!         // Button tag: 4
    @IBOutlet var buttonFive: UIButton!         // Button tag: 5
    @IBOutlet var buttonSix: UIButton!          // Button tag: 6
    @IBOutlet var buttonSubtract: UIButton!     // Button tag: 15
    @IBOutlet var buttonSeven: UIButton!        // Button tag: 7
    @IBOutlet var buttonEight: UIButton!        // Button tag: 8
    @IBOutlet var buttonNine: UIButton!         // Button tag: 9
    @IBOutlet var buttonMultiply: UIButton!     // Button tag: 16
    @IBOutlet var buttonClear: UIButton!        // Button tag: 11
    @IBOutlet var buttonPlusMinus: UIButton!    // Button tag: 12
    @IBOutlet var buttonPercentage: UIButton!   // Button tag: 13
    @IBOutlet var buttonDivide: UIButton!       // Button tag: 17
    
    var currentNumberStr = ""   // Keep track of the currently entering number
    var allNumberStr = ""   // Keep track of all entered numbers to display
    var allNumbers = [Double]() // All entered numbers
    var allOperators = [Int]()  // All entered operators
    var result = 0.0    // Current result
    var isDisplayingPercentage = false  // Displaying result as percentage or not
    var hasCalculated = false   // Finished calculation or not
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make custom view for all of the buttons
        let allButtons = [buttonZero, buttonOne, buttonTwo, buttonThree, buttonFour,
                          buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine,
                          buttonDot, buttonAdd, buttonSubtract, buttonMultiply,
                          buttonDivide, buttonClear, buttonPlusMinus, buttonPercentage,
                          buttonEqual]
        for button in allButtons {
            makeCustomView(for: button)
        }
    }
    
    func makeCustomView(for button: UIButton!) {
        // Make rounded-edge button
        button.layer.cornerRadius = 6
        
        // Make button casts shadow
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        
        // Set button's background
        switch button.tag {
        case 14...17:
            button.layer.backgroundColor = UIColor(red: 234/255, green: 99/255, blue: 140/255, alpha: 1).cgColor
        case 18:
            button.layer.backgroundColor = UIColor(red: 137/255, green: 2/255, blue: 62/255, alpha: 1).cgColor
        default:
            button.layer.backgroundColor = UIColor(red: 255/255, green: 217/255, blue: 218/255, alpha: 1).cgColor
        }
    }
    
    // Calculate the result from entered numbers
    func calculate() {
        switch allOperators[0] {
        case 14:
            result = allNumbers[0] + allNumbers[1]
        case 15:
            result = allNumbers[0] - allNumbers[1]
        case 16:
            result = allNumbers[0] * allNumbers[1]
        case 17:
            result = allNumbers[0] / allNumbers[1]
        default:
            return
        }
        
        hasCalculated = true
        
        updateResultLabel(with: result)
    }
    
    // Update the result label
    func updateResultLabel(with result: Double, percentage: Bool = false) {
        var resultString = ""
        
        if percentage {
            if floor(result * 100) == result * 100 {
                resultString = String(Int(result * 100)) + "%"
            } else {
                resultString = String(format: "%.2f", result * 100) + "%"
            }
        } else {
            if floor(result) == result {
                resultString = String(Int(result))
            } else {
                resultString = String(format: "%.4f", result)
            }
        }
        
        resultLabel.text = resultString
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 11:    // Clear
            currentNumberStr = ""
            allNumberStr = ""
            allNumbers = []
            allOperators = []
            result = 0.0
            updateResultLabel(with: result)
            hasCalculated = false
        case 12:    // Plus-minus
            result = -result
            updateResultLabel(with: result)
        case 13:    // Percentage
            isDisplayingPercentage = !isDisplayingPercentage
            updateResultLabel(with: result, percentage: isDisplayingPercentage)
        default:
            break
        }
        
        // Check if there are more than two numbers (or one operator) entered.
        // This calculator only supports two numbers at the moment.
        guard allOperators.count <= 1 else {
            if !hasCalculated {
                calculate()
            }
            
            let alert = UIAlertController(title: "We are sorry...", message: "This calculator only supports two numbers at the moment", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            
            return
        }
        
        switch sender.tag {
        case 0...9: // Numbers
            currentNumberStr += String(sender.tag)
            allNumberStr += String(sender.tag)
        case 10:    // Decimal period
            if !currentNumberStr.contains(".") {
                currentNumberStr += "."
                allNumberStr += "."
            }
        case 14:    // Add
            if let number = Double(currentNumberStr) {
                allNumbers.append(number)
                allOperators.append(sender.tag)
            }
            currentNumberStr = ""
            allNumberStr += " + "
        case 15:    // Subtract
            if let number = Double(currentNumberStr) {
                allNumbers.append(number)
                allOperators.append(sender.tag)
            }
            currentNumberStr = ""
            allNumberStr += " − "
        case 16:    // Multiply
            if let number = Double(currentNumberStr) {
                allNumbers.append(number)
                allOperators.append(sender.tag)
            }
            currentNumberStr = ""
            allNumberStr += " × "
        case 17:    // Divide
            if let number = Double(currentNumberStr) {
                allNumbers.append(number)
                allOperators.append(sender.tag)
            }
            currentNumberStr = ""
            allNumberStr += " ÷ "
        case 18:    // Equal
            if let number = Double(currentNumberStr) {
                allNumbers.append(number)
            }
            currentNumberStr = ""
            calculate()
        default:
            break
        }
        
        // Update the label that displays the detailed calculation
        detailLabel.text = allNumberStr
    }
    
}

