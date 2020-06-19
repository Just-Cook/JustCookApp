//
//  Font.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 18/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit

func sfRounded(size: CGFloat, weight: UIFont.Weight) -> UIFont{
    
    let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
    let descriptor = systemFont.fontDescriptor.withDesign(.rounded)
    
    let roundedFont = UIFont(descriptor: descriptor!, size: size)
    
    return roundedFont
}

