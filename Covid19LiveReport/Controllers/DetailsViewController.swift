//
//  DetailsViewController.swift
//  Covid19LiveReport
//
//  Created by Abdul Diallo on 3/23/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var DetailsWebPage: WKWebView!
    
    private let url = URL(string: "https://www.worldometers.info/coronavirus/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theURL = url {
            DetailsWebPage.load(URLRequest(url: theURL))
        }
        
    }
    

}
