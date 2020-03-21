//
//  dataGroup.swift
//  Covid19LiveReport
//
//  Created by Abdul Diallo on 3/20/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct DataGroup {
    
    var country : String
    var last_update : Int
    var confirmed : Int
    var deaths : Int
    var recovered : Int
    //var country_code : String
    
    init(country: String, last_update: Int, confirmed: Int, deaths: Int, recovered: Int) {
        self.country = country
        self.last_update = last_update
        self.confirmed = confirmed
        self.deaths = deaths
        self.recovered = recovered
        //self.country_code = country_code
    }
    
}
