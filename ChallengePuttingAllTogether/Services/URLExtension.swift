//
//  URLExtension.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
extension URL {
    static var tecnicas: URL{
        URL(string:  "https://justcook-api.herokuapp.com/tecnicas")!
    }
    
    static func itemsByTecnicaId(withID id: Int) -> URL{
        URL(string: "https://justcook-api.herokuapp.com/tecnicas/\(id)/items")!
    }
    
    static var modulos: URL{
         URL(string:  "https://justcook-api.herokuapp.com/modulos")!
    }
    static func moduloId(withID id: Int) -> URL{
           URL(string: "https://justcook-api.herokuapp.com/modulos/\(id)")!
       }
    
    static func tecnicasByModuloId(withID id: Int) -> URL{
              URL(string: "https://justcook-api.herokuapp.com/modulos/\(id)/tecnicas")!
          }
    static func receitasByModuloId(withID id: Int) -> URL{
             URL(string: "https://justcook-api.herokuapp.com/modulos/\(id)/receitas")!
    }
    static func receitaId(withID id: Int) -> URL{
                URL(string: "https://justcook-api.herokuapp.com/receitas/\(id)")!
       }
    static func ingredientesByReceitaId(withID id: Int) -> URL{
             URL(string: "https://justcook-api.herokuapp.com/receitas/\(id)/ingredientes")!
    }
    
    static func passosByReceitaId(withID id: Int) -> URL{
                URL(string: "https://justcook-api.herokuapp.com/receitas/\(id)/passos")!
       }
}
