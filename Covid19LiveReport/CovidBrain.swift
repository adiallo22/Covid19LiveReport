//
//  CovidBrain.swift
//  Covid19LiveReport
//
//  Created by Abdul Diallo on 3/20/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

protocol CovidBrainDelegate {
    func failWithError(error: Error)
    func updateData(result: DataGroup, country: String)
}
struct CovidBrain {
    
    var delegate : CovidBrainDelegate?
    
    let baseURL = "https://health-api.com/api/v1/covid-19/"
    
    let countries = [  "AF: Afghanistan",
       "AL: Albania",
       "DZ: Algeria",
       "AS: American Samoa",
       "AD: Andorra",
       "AO: Angola",
       "AI: Anguilla",
       "AQ: Antarctica",
       "AG: Antigua and Barbuda",
       "AR: Argentina",
       "AM: Armenia",
       "AW: Aruba",
       "AU: Australia",
       "AT: Austria",
       "AZ: Azerbaijan",
       "BS: Bahamas (the)",
       "BH: Bahrain",
       "BD: Bangladesh",
       "BB: Barbados",
       "BY: Belarus",
       "BE: Belgium",
       "BZ: Belize",
       "BJ: Benin",
       "BM: Bermuda",
       "BT: Bhutan",
       "BO: Bolivia (Plurinational State of)",
       "BQ: Bonaire, Sint Eustatius and Saba",
       "BA: Bosnia and Herzegovina",
       "BW: Botswana",
       "BV: Bouvet Island",
       "BR: Brazil",
       "IO: British Indian Ocean Territory (the)",
       "BN: Brunei Darussalam",
       "BG: Bulgaria",
       "BF: Burkina Faso",
       "BI: Burundi",
       "CV: Cabo Verde",
       "KH: Cambodia",
       "CM: Cameroon",
       "CA: Canada",
       "KY: Cayman Islands (the)",
       "CF: Central African Republic (the)",
       "TD: Chad",
       "CL: Chile",
       "CN: China",
       "CX: Christmas Island",
       "CC: Cocos (Keeling) Islands (the)",
       "CO: Colombia",
       "KM: Comoros (the)",
       "CD: Congo (the Democratic Republic of the)",
       "CG: Congo (the)",
       "CK: Cook Islands (the)",
       "CR: Costa Rica",
       "HR: Croatia",
       "CU: Cuba",
       "CW: Curaçao",
       "CY: Cyprus",
       "CZ: Czechia",
       "CI: Côte d'Ivoire",
       "DK: Denmark",
       "DJ: Djibouti",
       "DM: Dominica",
       "DO: Dominican Republic (the)",
       "EC: Ecuador",
       "EG: Egypt",
       "SV: El Salvador",
       "GQ: Equatorial Guinea",
       "ER: Eritrea",
       "EE: Estonia",
       "SZ: Eswatini",
       "ET: Ethiopia",
       "FK: Falkland Islands (the) [Malvinas]",
       "FO: Faroe Islands (the)",
       "FJ: Fiji",
       "FI: Finland",
       "FR: France",
       "GF: French Guiana",
       "PF: French Polynesia",
       "TF: French Southern Territories (the)",
       "GA: Gabon",
       "GM: Gambia (the)",
       "GE: Georgia",
       "D:  Germany",
       "GH: Ghana",
       "GI: Gibraltar",
       "GR: Greece",
       "GL: Greenland",
       "GD: Grenada",
       "GP: Guadeloupe",
       "GU: Guam",
       "GT: Guatemala",
       "GG: Guernsey",
       "GN: Guinea",
       "GW: Guinea-Bissau",
       "GY: Guyana",
       "HT: Haiti",
       "HM: Heard Island and McDonald Islands",
       "VA: Holy See (the)",
       "HN: Honduras",
       "HK: Hong Kong",
       "HU: Hungary",
       "IS: Iceland",
       "IN: India",
       "ID: Indonesia",
       "IR: Iran (Islamic Republic of)",
       "IQ: Iraq",
       "IE: Ireland",
       "IM: Isle of Man",
       "IL: Israel",
       "IT: Italy",
       "JM: Jamaica",
       "JP: Japan",
       "JE: Jersey",
       "JO: Jordan",
       "KZ: Kazakhstan",
       "KE: Kenya",
       "KI: Kiribati",
       "KP: Korea (the Democratic People's Republic of)",
       "KR: Korea (the Republic of)",
       "KW: Kuwait",
       "KG: Kyrgyzstan",
       "LA: Lao People's Democratic Republic (the)",
       "LV: Latvia",
       "LB: Lebanon",
       "LS: Lesotho",
       "LR: Liberia",
       "LY: Libya",
       "LI: Liechtenstein",
       "LT: Lithuania",
       "LU: Luxembourg",
       "MO: Macao",
       "MG: Madagascar",
       "MW: Malawi",
       "MY: Malaysia",
       "MV: Maldives",
       "ML: Mali",
       "MT: Malta",
       "MH: Marshall Islands (the)",
       "MQ: Martinique",
       "MR: Mauritania",
       "MU: Mauritius",
       "YT: Mayotte",
       "MX: Mexico",
       "FM: Micronesia (Federated States of)",
       "MD: Moldova (the Republic of)",
       "MC: Monaco",
       "MN: Mongolia",
       "ME: Montenegro",
       "MS: Montserrat",
       "MA: Morocco",
       "MZ: Mozambique",
       "MM: Myanmar",
       "NA: Namibia",
       "NR: Nauru",
       "NP: Nepal",
       "NL: Netherlands (the)",
       "NC: New Caledonia",
       "NZ: New Zealand",
       "NI: Nicaragua",
       "NE: Niger (the)",
       "NG: Nigeria",
       "NU: Niue",
       "NF: Norfolk Island",
       "MP: Northern Mariana Islands (the)",
       "NO: Norway",
       "OM: Oman",
       "PK: Pakistan",
       "PW: Palau",
       "PS: Palestine, State of",
       "PA: Panama",
       "PG: Papua New Guinea",
       "PY: Paraguay",
       "PE: Peru",
       "PH: Philippines (the)",
       "PN: Pitcairn",
       "PL: Poland",
       "PT: Portugal",
       "PR: Puerto Rico",
       "QA: Qatar",
       "MK: Republic of North Macedonia",
       "RO: Romania",
       "RU: Russian Federation (the)",
       "RW: Rwanda",
       "RE: Réunion",
       "BL: Saint Barthélemy",
       "SH: Saint Helena, Ascension and Tristan da Cunha",
       "KN: Saint Kitts and Nevis",
       "LC: Saint Lucia",
       "MF: Saint Martin (French part)",
       "PM: Saint Pierre and Miquelon",
       "VC: Saint Vincent and the Grenadines",
       "WS: Samoa",
       "SM: San Marino",
       "ST: Sao Tome and Principe",
       "SA: Saudi Arabia",
       "SN: Senegal",
       "RS: Serbia",
       "SC: Seychelles",
       "SL: Sierra Leone",
       "SG: Singapore",
       "SX: Sint Maarten (Dutch part)",
       "SK: Slovakia",
       "SI: Slovenia",
       "SB: Solomon Islands",
       "SO: Somalia",
       "ZA: South Africa",
       "GS: South Georgia and the South Sandwich Islands",
       "SS: South Sudan",
       "ES: Spain",
       "LK: Sri Lanka",
       "SD: Sudan (the)",
       "SR: Suriname",
       "SJ: Svalbard and Jan Mayen",
       "SE: Sweden",
       "CH: Switzerland",
       "SY: Syrian Arab Republic",
       "TW: Taiwan (Province of China)",
       "TJ: Tajikistan",
       "TZ: Tanzania, United Republic of",
       "TH: Thailand",
       "TL: Timor-Leste",
       "TG: Togo",
       "TK: Tokelau",
       "TO: Tonga",
       "TT: Trinidad and Tobago",
       "TN: Tunisia",
       "TR: Turkey",
       "TM: Turkmenistan",
       "TC: Turks and Caicos Islands (the)",
       "TV: Tuvalu",
       "UG: Uganda",
       "UA: Ukraine",
       "AE: United Arab Emirates (the)",
       "GB: United Kingdom of Great Britain and Northern Ireland (the)",
       "UM: United States Minor Outlying Islands (the)",
       "US: United States of America (the)",
       "UY: Uruguay",
       "UZ: Uzbekistan",
       "VU: Vanuatu",
       "VE: Venezuela (Bolivarian Republic of)",
       "VN: Viet Nam",
       "VG: Virgin Islands (British)",
       "VI: Virgin Islands (U.S.)",
       "WF: Wallis and Futuna",
       "EH: Western Sahara",
       "YE: Yemen",
       "ZM: Zambia",
       "ZW: Zimbabwe",
       "AX: Aland Islands"
    ]
    
    func returnData(_ country : String) {
        let fullURL = "\(baseURL)\(country)"
        if let url = URL(string: fullURL) {
            let task = URLSession(configuration: .default).dataTask(with: url) { (data, repsonse, error) in
                if error != nil {
                    self.delegate?.failWithError(error: error!)
                    return
                }
                if let existData = data {
                    if let result = self.parseJSON(existData) {
                        self.delegate?.updateData(result: result, country: country)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> DataGroup? {
        let decoder = JSONDecoder()
        do {
            let dataDecoded = try decoder.decode(CovidData.self, from: data)
            let country = dataDecoded.country
            let confirmed = dataDecoded.confirmed
            let country_code = dataDecoded.country_code
            let deaths = dataDecoded.deaths
            let last_update = dataDecoded.last_update
            let recovered = dataDecoded.recovered
            let dataGroup = DataGroup(country: country, last_update: last_update, confirmed: confirmed, deaths: deaths, recovered: recovered, country_code: country_code)
            return dataGroup
        } catch {
            delegate?.failWithError(error: error)
            return nil
        }
    }

    
    
}
