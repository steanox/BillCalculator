//
//  ViewController.swift
//  BillCalculator
//
//  Created by octavianus on 13/09/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberButtons: [UIButton]!
    
    @IBOutlet weak var commandLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var taxPicker: UIPickerView!
    @IBOutlet weak var servicePicker: UIPickerView!
    
    let calculatorHelper = CalculatorHelper()
    
    var commandStacks: String = "" {
        didSet {
            updateCommand()
        }
    }
    
    var resultValue = 0.0 {
        didSet{
            updateResult()
        }
    }
    
    var taxPercentage = 0.0 {
        didSet{
            updateResult()
        }
    }
    
    var servicePercentage = 0.0 {
        didSet{
            updateResult()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taxPicker.dataSource = self
        servicePicker.dataSource = self
        taxPicker.delegate = self
        servicePicker.delegate = self
    }
    
    private func updateCommand(){
        commandLabel.text = commandStacks
    }
    
    private func updateResult(){
        let priceAfterservice = resultValue + calculatorHelper.getPercentageOf(self.servicePercentage, from: resultValue)
        
        let priceAfterTax = priceAfterservice + calculatorHelper.getPercentageOf(self.taxPercentage, from: priceAfterservice)
        
        self.resultLabel.text = calculatorHelper.forTrailingZero(temp: priceAfterTax)
        
    }
    
    @IBAction func numberAndOperatorButtonsHandler(_ sender: UIButton){
        guard let text = sender.titleLabel?.text else { return }
        self.commandStacks.append(text)
    }
    
    
    
    @IBAction func equalButtonHandler(_ sender: UIButton) {
        self.resultValue = calculatorHelper.result(commandStacks: self.commandStacks)
    }
    
    @IBAction func deleteButtonHandler(){
        commandStacks.popLast()
    }
    
    @IBAction func clearButtonHandler(){
        commandStacks.removeAll()
        resultLabel.text?.removeAll()
    }
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 21
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == taxPicker { self.taxPercentage = Double(row) }
        else
        if pickerView == servicePicker { self.servicePercentage = Double(row) }
    }
}



