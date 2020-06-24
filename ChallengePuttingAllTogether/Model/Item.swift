//
//  Item.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 22/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct Item : Decodable{
    let id: Int
    let titulo:String
    let descricao:String
    let imageName: String?
    let tecnicaId:Int
    
    private enum CodingKeys: String, CodingKey{
           case id, titulo, descricao, imageName = "image_name", tecnicaId = "tecnica_id"
       }
}

