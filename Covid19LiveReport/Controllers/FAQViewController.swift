//
//  FAQViewController.swift
//  Covid19LiveReport
//
//  Created by Abdul Diallo on 3/23/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import WebKit

class FAQViewController: UIViewController {

    @IBOutlet weak var FAQWebPage: WKWebView!
    
    private let url = URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/faq.html")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let theURL = url {
            FAQWebPage.load(URLRequest(url: theURL))
        }
        
    }
    

    

}
