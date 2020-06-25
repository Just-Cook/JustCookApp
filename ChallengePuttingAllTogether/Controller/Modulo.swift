//
//  Modulo.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

struct Modulo: Decodable{
    let id : Int
    let titulo : String
    let subtitulo: String
    let descricao : String
    let imageName: String
    let nivel: Int
    
    
    private enum CodingKeys: String, CodingKey{
              case id, titulo, subtitulo, descricao, imageName = "image_name", nivel
          }
}
