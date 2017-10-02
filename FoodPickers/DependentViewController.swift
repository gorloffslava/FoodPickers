//
//  DependentViewController.swift
//  FoodPickers
//
//  Created by Вячеслав Горлов on 01.10.17.
//  Copyright © 2017 Gorloff Foundation. All rights reserved.
//

import UIKit

class DependentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var names: [String]!
    var lastnames: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.names = Crew.names
        self.lastnames = Crew.lastnames
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        self.label.text = Crew.isInCrew(player: Crew.Player(
            name: self.names[self.pickerView.selectedRow(inComponent: 0)],
            lastname: self.lastnames[self.pickerView.selectedRow(inComponent: 1)],
            rang: "")) ? "Верно" : "Неверно"
        self.label.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == 0) ? self.names.count : self.lastnames.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? self.names[row] : (self.lastnames + [Crew.findRangForName(self.names[self.pickerView.selectedRow(inComponent: 0)])!])[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.label.isHidden = true
        if component == 0 {
            self.pickerView.reloadComponent(1)
            self.pickerView.selectRow(0, inComponent: 1, animated: true)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let size = self.pickerView.bounds.width
        return component == 0 ? size / 3 : size / 3 * 2
    }

}
