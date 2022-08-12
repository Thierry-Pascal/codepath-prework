//
//  SettingsViewController.swift
//  Prework
//
//  Created by Thierry-Pascal Fleurant on 8/11/22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var percentOneLabelField: UITextField!
    @IBOutlet weak var percentTwoLabelField: UITextField!
    @IBOutlet weak var percentThreeLabelField: UITextField!
    
    var percentOne = ""
    var percentTwo = ""
    var percentThree = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Assigning the UserDefault values to the Text Field Boxes
        let defaults = UserDefaults.standard
        percentOne = defaults.string(forKey: "percentOne") ?? "15"
        percentOneLabelField.placeholder = percentOne
        percentTwo = defaults.string(forKey: "percentTwo") ?? "18"
        percentTwoLabelField.placeholder = percentTwo
        percentThree = defaults.string(forKey: "percentThree") ?? "20"
        percentThreeLabelField.placeholder = percentThree
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    // Updating changes on Percentage One
    @IBAction func changePercentOne(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentOneLabelField.text, forKey: "percentOne")
        defaults.synchronize()
    }
    // Updating changes on Percentage Two
    @IBAction func changePercentTwo(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentTwoLabelField.text, forKey: "percentTwo")
        defaults.synchronize()
    }
    // Updating changes on Percentage Three
    @IBAction func changePercentThree(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentThreeLabelField.text, forKey: "percentThree")
        defaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
