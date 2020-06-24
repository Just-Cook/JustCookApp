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


extension Modulo{
    static func mock() -> [Modulo]{
        var modulos = [Modulo]()
        
        modulos.append(Modulo(id: 1, titulo: "modulo 1", subtitulo: "modulo 1", descricao: "descricao qualqer", imageName: "forma", nivel: 2))
         modulos.append(Modulo(id: 1, titulo: "modulo 2", subtitulo: "modulo 1", descricao: "descricao qualqer", imageName: "forma", nivel: 2))
        
        return modulos
    }
}
