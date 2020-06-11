//
//  PrepCard.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class Card {
    var imageBackg: String 
    var check: String
    var name: String
    var subtitle: String
    var time: String
    var serving: String
    
    
   
    
    init(_ imageBackg: String, _ check: String, _ name: String, _ time: String, _ serving: String, _ subtitle:String)
    {
        self.imageBackg = imageBackg
        self.check = check
        self.name = name
        self.time = time
        self.serving = serving
        self.subtitle = subtitle
    }
    
 
    
}
