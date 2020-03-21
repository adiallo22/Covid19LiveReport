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
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var infectedLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var deathsRate: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var recoveredRateLabel: UILabel!
    
    enum Segues {
        static let goToData = "goToChild"
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
            let destinationVC = segue.destination as! ChildViewController
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
        return covidBrain.countries[row]
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
            self.countryLabel.text = result.country.uppercased()
            self.infectedLabel.text = "\(result.confirmed)"
            self.deathsLabel.text = "\(result.deaths)"
            self.deathsRate.text = "\(String(format: "%.2f", Double(result.deaths) / Double(result.confirmed)*100.0))%"
            self.recoveredLabel.text = "\(result.recovered)"
            self.recoveredRateLabel.text = "\(String(format: "%.2f", Double(result.recovered) / Double(result.confirmed)*100.0))%"
        }
    }
    
}

