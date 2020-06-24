//
//  ReceitaRepository.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 24/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class ReceitaRepository{
    
    
       func receitasModuloId(moduloId:Int, completion: @escaping ([Receita]) -> Void){
           HTTP.get.request(url: .receitasByModuloId(withID: moduloId)){
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
                                let tecnicas: [Receita] = (try? JSONDecoder().decode(Array<Receita>.self, from: data)) ?? []
                                completion(tecnicas)
                                  return
                            default:
                                completion([])
                                return
                            }
                            
                        }
                        
              }
    
}
