//
//  PerfilModel.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct ConquistasModel {
    
    var image:String
    var titulo:String
}

extension ConquistasModel{
    
   static func MockConquistas() -> [ConquistasModel]{
         var conquistas = [ConquistasModel]()
        
        conquistas.append(ConquistasModel(image: "primeira", titulo: "Primeira receita"))
        conquistas.append(ConquistasModel(image: "basico", titulo: "Basiquinho"))
        conquistas.append(ConquistasModel(image: "saudavel", titulo: "Saudável e barato"))
        conquistas.append(ConquistasModel(image: "domingo", titulo: "Almoço de domingo"))
        conquistas.append(ConquistasModel(image: "literaria", titulo: "Culinária literária"))

        
        
        return conquistas
    }
    
}
