//
//  CustomViewController.swift
//  FoodPickers
//
//  Created by Вячеслав Горлов on 01.10.17.
//  Copyright © 2017 Gorloff Foundation. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private var winSoundID: SystemSoundID = 0
    private var processSoundID: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let winSound = Bundle.main.url(forResource: "win", withExtension: "wav")
        AudioServicesCreateSystemSoundID(winSound! as CFURL, &winSoundID)
        let processSound = Bundle.main.url(forResource: "process", withExtension: "wav")
        AudioServicesCreateSystemSoundID(processSound! as CFURL, &processSoundID)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func spin(_ sender: Any) {
        self.label.isHidden = true
        
        for i in 0...2 {
            self.picker.selectRow(Int(arc4random_uniform(UInt32(self.images.count - 1))), inComponent: i, animated: true)
        }
        AudioServicesPlaySystemSound(processSoundID)
        
        if self.picker.selectedRow(inComponent: 0) == self.picker.selectedRow(inComponent: 1) && self.picker.selectedRow(inComponent: 0) == self.picker.selectedRow(inComponent: 2) {
            self.label.isHidden = false
            self.label.text = "Победа!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                AudioServicesPlaySystemSound(self.winSoundID)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let images = [
        UIImage(named: "002_pumpkin"),
        UIImage(named: "005_candies"),
        UIImage(named: "008_living_dead")
    ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return UIImageView(image: self.images[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
}
