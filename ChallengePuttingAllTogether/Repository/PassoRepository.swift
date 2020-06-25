//
//  PassoRepository.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 24/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation


class PassosRepository{
func passosByReceitaId(receitaId:Int, completion: @escaping ([Page]) -> Void){
    HTTP.get.request(url: .passosByReceitaId(withID: receitaId)){
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
                         let pages: [Page] = (try? JSONDecoder().decode(Array<Page>.self, from: data)) ?? []
                         
                         completion(pages)
                           return
                     default:
                         completion([])
                         return
                     }
                     
                 }
                 
       }
}
