//
//  Ingredient.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct Ingrediente: Decodable{
    
    let id: Int
    let nome: String
    let quantidade: Int?
    let unidade: String?
    let receitaId: Int
    
    private enum CodingKeys: String, CodingKey{
          case id, nome, quantidade, unidade, receitaId = "receita_id"
      }
   
}
