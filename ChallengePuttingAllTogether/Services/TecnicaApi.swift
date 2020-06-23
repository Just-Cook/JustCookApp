//
//  TecnicaApi.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

enum TecnicaAPI: Router{
    case listar
  
    
    var hostname: String{
        get{
            return "https://justcook-api.herokuapp.com"
        }
    }
    
    var url: URL?{
        get{
            switch self {
            case .listar: return URL(string: "\(hostname)/tecnicas")
            
            }
        }
    }
    
  
}
