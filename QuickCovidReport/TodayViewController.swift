//
//  TodayViewController.swift
//  QuickCovidReport
//
//  Created by Abdul Diallo on 3/26/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = UserDefaults.init(suiteName: "group.com.abdulCo.widget")?.value(forKey: "country") {
            countryLabel.text = country as? String
        }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}