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
    
    static func items(withID id: Int) -> URL{
        URL(string: "https://justcook-api.herokuapp.com/tecnicas/\(id)/items")!
    }
}
