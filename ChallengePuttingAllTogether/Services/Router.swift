//
//  Router.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

protocol Router {
    var hostname: String {get}
    var url: URL? {get}
}
