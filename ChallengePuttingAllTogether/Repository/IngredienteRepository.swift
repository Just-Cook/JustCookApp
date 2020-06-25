//
//  IngredienteRepository.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 24/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class IngredienteRepository {
    
  func ingredientesByReceitaId(receitaId:Int, completion: @escaping ([Ingrediente]) -> Void){
    HTTP.get.request(url: .ingredientesByReceitaId(withID: receitaId)){
             data, response, error in
             
             if let error = error {
                           print(error)
                           completion([])
                           return
                       }
                       
                       guard let data = data, let response = response else {
                           completion([])
                        
                           return
                       }
                
                       switch response.statusCode {
                       case 200:
                           let ingredientes: [Ingrediente] = (try? JSONDecoder().decode(Array<Ingrediente>.self, from: data)) ?? []
                    
                           completion(ingredientes)
                             return
                       default:
                           completion([])
                           return
                       }
                       
                   }
                   
         }
}
