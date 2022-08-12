//
//  ViewController.swift
//  Prework
//
//  Created by Thierry-Pascal Fleurant on 8/11/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partyStepper: UIStepper!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    var percentOne = ""
    var percentTwo = ""
    var percentThree = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Using UserDefaults to track the default percentages used
        let defaults = UserDefaults.standard
        percentOne = defaults.string(forKey: "percentOne") ?? "15"
        tipControl.setTitle(percentOne + "%", forSegmentAt: 0)
        percentTwo = defaults.string(forKey: "percentTwo") ?? "18"
        tipControl.setTitle(percentTwo + "%", forSegmentAt: 1)
        percentThree = defaults.string(forKey: "percentThree") ?? "20"
        tipControl.setTitle(percentThree + "%", forSegmentAt: 2)
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Retrieving the bill amount from the text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
          // Getting the tip amount by multiplying bill * tipPercentages
        let tip1 = (Double(percentOne) ?? 0) / 100
        let tip2 = (Double(percentTwo) ?? 0) / 100
        let tip3 = (Double(percentThree) ?? 0) / 100
        let tipPercentages = [tip1, tip2, tip3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let totalPerPerson = total / partyStepper.value
        
        // Updating the tip amount
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Updating the total and total per person amounts
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
    }
    @IBAction func stepperControl(_ sender: Any) {
        // Set up the party size
        partySizeLabel.text = String(Int(partyStepper.value))
        print(partySizeLabel.text)
    }
    
    
    
}

