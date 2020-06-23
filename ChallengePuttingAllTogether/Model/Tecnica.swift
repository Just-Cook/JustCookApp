//
//  Tecnica.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 19/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct Tecnica: Decodable{
    let id: Int
    let titulo:String
    let imageName: String
    
    private enum CodingKeys: String, CodingKey{
        case id, titulo, imageName = "image_name"
    }
}

