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
    
    @IBOutlet var buttonZero: UIButton!
    @IBOutlet var buttonDot: UIButton!
    @IBOutlet var buttonEqual: UIButton!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonAdd: UIButton!
    @IBOutlet var buttonFour: UIButton!
    @IBOutlet var buttonFive: UIButton!
    @IBOutlet var buttonSix: UIButton!
    @IBOutlet var buttonSubtract: UIButton!
    @IBOutlet var buttonSeven: UIButton!
    @IBOutlet var buttonEight: UIButton!
    @IBOutlet var buttonNine: UIButton!
    @IBOutlet var buttonMultiply: UIButton!
    @IBOutlet var buttonClear: UIButton!
    @IBOutlet var buttonPlusMinus: UIButton!
    @IBOutlet var buttonPercentage: UIButton!
    @IBOutlet var buttonDivide: UIButton!
    
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
        button.layer.cornerRadius = 6
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.3
        
        switch button.tag {
        case 1:
            button.layer.backgroundColor = UIColor(red: 234/255, green: 99/255, blue: 140/255, alpha: 1).cgColor
        case 2:
            button.layer.backgroundColor = UIColor(red: 137/255, green: 2/255, blue: 62/255, alpha: 1).cgColor
        default:
            button.layer.backgroundColor = UIColor(red: 255/255, green: 217/255, blue: 218/255, alpha: 1).cgColor
        }
        
    }


}

