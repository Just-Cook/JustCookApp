//
//  PerfilModel.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct ConquistasModel {
    
    var id: Int
    var image:String
    var titulo:String
}

extension ConquistasModel{
    
   static func MockConquistas() -> [ConquistasModel]{
         var conquistas = [ConquistasModel]()
        
        conquistas.append(ConquistasModel(id:1, image: "primeira", titulo: "Primeira receita"))
        conquistas.append(ConquistasModel(id:2,image: "basico", titulo: "Basiquinho"))
        conquistas.append(ConquistasModel(id:3,image: "saudavel", titulo: "Saudável e barato"))
        conquistas.append(ConquistasModel(id:4,image: "domingo", titulo: "Almoço de domingo"))
        conquistas.append(ConquistasModel(id:5,image: "literaria", titulo: "Culinária literária"))

        
        
        return conquistas
    }
    
}
