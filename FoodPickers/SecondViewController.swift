//
//  SecondViewController.swift
//  FoodPickers
//
//  Created by Вячеслав Горлов on 01.10.17.
//  Copyright © 2017 Gorloff Foundation. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.names.count
        } else {
            return self.lastnames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? self.names[row] : self.lastnames[row]
    }
    

    private var names: [String]!
    private var lastnames: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.names = Crew.names
        self.lastnames = Crew.lastnames
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.label.text = Crew.isInCrew(player: Crew.Player(
            name: self.names[self.picker.selectedRow(inComponent: 0)],
            lastname: self.lastnames[self.picker.selectedRow(inComponent: 1)],
            rang: "")) ? "Верно" : "Неверно"
        self.label.isHidden = false
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.label.isHidden = true
    }
    
    
    
    
    
}

