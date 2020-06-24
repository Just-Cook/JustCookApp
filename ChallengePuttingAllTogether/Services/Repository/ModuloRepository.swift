//
//  ModuloRepository.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class ModuloRepository{
    
       func listar(completion: @escaping ([Modulo]) -> Void){
        HTTP.get.request(url: .modulos){
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
                                 let modulos: [Modulo] = (try? JSONDecoder().decode(Array<Modulo>.self, from: data)) ?? []
                                 
                                 completion(modulos)
                                 return
                             default:
                                 completion([])
                                 return
                             }
                             
                         }
                         
               }
    
    
    
    func moduloId(moduloId: Int, completion: @escaping (Modulo) -> Void){
    HTTP.get.request(url: .moduloId(withID: moduloId)){
               data, response, error in
               
               if let error = error {
                             print(error)
                        //     completion([])
                             return
                         }
                         
                         guard let data = data, let response = response else {
                         //    completion([])
                             return
                         }
                         
                         switch response.statusCode {
                         case 200:
                             let modulos: Modulo = (try? JSONDecoder().decode(Modulo.self, from: data))!
                             
                              completion(modulos)
                             return
                         default:
                           //  completion([])
                             return
                         }
                         
                     }
                     
           }
}
