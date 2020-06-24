//
//  Recipe.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct Receita: Decodable{
    
    let id: Int
    let titulo: String
    let descricao: String
    let imageName: String
    let rendimento: Int
    let tempo: Int

    
    private enum CodingKeys: String, CodingKey{
         case id, titulo, descricao, imageName = "image_name", rendimento, tempo
    }

}
