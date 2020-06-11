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
        
        conquistas.append(ConquistasModel(image: "", titulo: "Minha primeira conquista"))
        conquistas.append(ConquistasModel(image: "", titulo: "conquista 2"))
        conquistas.append(ConquistasModel(image: "", titulo: "mais uma"))
        conquistas.append(ConquistasModel(image: "", titulo: "outra conquista"))
        conquistas.append(ConquistasModel(image: "", titulo: "Outra"))
        conquistas.append(ConquistasModel(image: "", titulo: "Minha ultima conquista"))
        
        
        return conquistas
    }
    
}
