//
//  Page.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct Page:Decodable{
    
    let id:Int
    let descricao: String
    let imageName: String
    let cronometro: Int?
    let tip: String?
    
  private enum CodingKeys: String, CodingKey{
            case id, descricao, imageName = "image_name", cronometro, tip
        }
}
