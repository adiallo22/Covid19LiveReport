//
//  ViewController.swift
//  Covid19LiveReport
//
//  Created by Abdul Diallo on 3/19/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryPicker: UIPickerView!
    var destVC : ChildViewController? = nil
    
    enum Segues {
        static let goToData = "goToChild"
        static let goToFAQ = "goToFAQ"
    }
    
    var covidBrain = CovidBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPicker.delegate = self
        countryPicker.dataSource = self
        covidBrain.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.goToData {
            destVC = segue.destination as! ChildViewController
        }
        
        if segue.identifier == Segues.goToFAQ {
            let destinationVC = segue.destination as! FAQViewController
        }
    }
    

}

//MARK: - picker datasource and delegate

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return covidBrain.countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = covidBrain.countries[row]
        let start = title.index(title.startIndex, offsetBy: 3)
        return String(title[start...])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let country = covidBrain.countries[row].prefix(2)
        covidBrain.returnData(String(country))
    }
    
}

//MARK: - covid brain delegate

extension ViewController : CovidBrainDelegate {
    
    func failWithError(error: Error) {
        print(error)
    }
    
    func updateData(result: DataGroup, country: String) {
        DispatchQueue.main.async {
            self.destVC?.countryLab.text = result.country.uppercased()
            self.destVC?.infectedLab.text = "\(result.confirmed)"
            self.destVC?.deathLab.text = "\(result.deaths)"
            self.destVC?.deathRateLab.text = "\(String(format: "%.2f", Double(result.deaths) / Double(result.confirmed)*100.0))%"
            self.destVC?.recoveryLab.text = "\(result.recovered)"
            self.destVC?.recoveryRateLab.text = "\(String(format: "%.2f", Double(result.recovered) / Double(result.confirmed)*100.0))%"
        }
    }
    
}

