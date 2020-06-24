//
//  TecnicaRepository.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class TecnicaRepository{
    
    func listar(completion: @escaping ([Tecnica]) -> Void){
        HTTP.get.request(url: .tecnicas){
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
                          let tecnicas: [Tecnica] = (try? JSONDecoder().decode(Array<Tecnica>.self, from: data)) ?? []
                          completion(tecnicas)
                            return
                      default:
                          completion([])
                          return
                      }
                      
                  }
                  
        }
}
    
    
    

