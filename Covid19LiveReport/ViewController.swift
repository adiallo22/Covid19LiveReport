//
//  ViewController.swift
//  Covid19LiveReport
//
//  Created by Abdul Diallo on 3/19/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CovidBrainDelegate {

    @IBOutlet weak var countryPicker: UIPickerView!
    
    var covidBrain = CovidBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPicker.delegate = self
        countryPicker.dataSource = self
        covidBrain.delegate = self
    }
    
    func failWithError(error: Error) {
        print(error)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return covidBrain.countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return covidBrain.countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let country = covidBrain.countries[row].prefix(2)
        covidBrain.returnData(String(country))
    }

}

