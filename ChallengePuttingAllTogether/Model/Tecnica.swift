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

struct TecnicaResponse: Decodable{
    var tecnicas : [Tecnica]
}

extension Tecnica{
    static func mockTecnica()-> [Tecnica]{
        var tecnicas=[Tecnica]()
        
        tecnicas.append(Tecnica(id: 1, titulo: "Como utilzar o forno?",  imageName: "maminha1"))
        
        tecnicas.append(Tecnica(id: 2, titulo: "Dicas e curiosidades", imageName: "maminha1"))
        
        tecnicas.append(Tecnica(id: 3, titulo: "O que é maminha?", imageName: "forno"))
        
        tecnicas.append(Tecnica(id: 4, titulo: "Panelas",  imageName: "forno"))
        
        
        return tecnicas
    }
  
    
    
}
