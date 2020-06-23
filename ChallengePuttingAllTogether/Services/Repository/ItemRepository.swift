//
//  ItemRepository.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class ItemRepository{
    
func listar(tecnicaId: Int, completion: @escaping ([Item]) -> Void){
    HTTP.get.request(url: .items(withID: tecnicaId)){
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
                          let items: [Item] = (try? JSONDecoder().decode(Array<Item>.self, from: data)) ?? []
                          
                          completion(items)
                          return
                      default:
                          completion([])
                          return
                      }
                      
                  }
                  
        }
}
