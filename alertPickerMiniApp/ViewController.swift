//
//  ViewController.swift
//  alertPickerMiniApp
//
//  Created by Jonah Whitney on 2/22/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var colorOptions: [String] = [String]()
    var styleOptions: [String] = [String]()
    
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var otherPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        otherPicker.delegate = self
        otherPicker.dataSource = self
        
        colorOptions = ["Red", "White", "Sparkling", "Other"]
        styleOptions = ["Cabernet", "Merlot", "Pinot Noir", "Blend"]
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return colorOptions.count
        } else {
            return styleOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return colorOptions[row]
        } else {
            return styleOptions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            
            updateStyleOptions(forRow: row)
            otherPicker.reloadAllComponents()
        }
    }
    
    // this method updates the data in the second picker based on the selection from the first
    func updateStyleOptions(forRow row: Int) {
        switch row {
        case 0:
            styleOptions = ["Cabernet", "Merlot", "Pinot Noir", "Blend"]
        case 1:
            styleOptions = ["Chardonnay", "Suav Blanc", "Pinot Grigio", "Blend"]
        case 2:
            styleOptions = ["Champaigne", "Prosecco", "Brute"]
        default:
            styleOptions = ["Other"]
        }
        }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let colorIndex = myPicker.selectedRow(inComponent: 0)
        let styleIndex = otherPicker.selectedRow(inComponent: 0)
        
        let alert = UIAlertController(title: "Selection", message: "\(colorOptions[colorIndex]) \(styleOptions[styleIndex])", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
        })
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

