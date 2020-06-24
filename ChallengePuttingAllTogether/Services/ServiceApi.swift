//
//  TecnicaApi.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

enum ServiceApi: Router{
    
    
    case listarTecnicas
    case listarItems
 //   case listarItemsByTecnicaId
  
  
    var hostname: String{
        get{
            return "https://justcook-api.herokuapp.com"
        }
    }
    
    var url: URL?{
        get{
            switch self {
            case .listarTecnicas: return URL(string: "\(hostname)/tecnicas")
            case .listarItems: return URL(string: "\(hostname)/tecnicas")
            
            }
        }
    }
  
    
  
}
