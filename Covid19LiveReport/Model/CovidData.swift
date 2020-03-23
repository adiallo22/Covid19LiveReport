//
//  covidData.swift
//  Covid19LiveReport
//
//  Created by Abdul Diallo on 3/20/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct CovidData : Codable {
    
    var country : String
    var last_update : Int
    var confirmed : Int
    var deaths : Int
    var recovered : Int
    //var country_code : String
    
}
