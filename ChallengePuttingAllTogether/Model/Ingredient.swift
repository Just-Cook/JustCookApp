//
//  Ingredient.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class Ingredient{
    
    let id: Int
    let name: String
    let amount: Double
    let unity: String
    
    init(name:String, amount:Double, unity:String) {
        id = 1
        self.name = name
        self.amount = amount
        self.unity = unity
    }
    
}
