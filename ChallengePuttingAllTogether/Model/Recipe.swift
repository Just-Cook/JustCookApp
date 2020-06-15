//
//  Recipe.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

public class Recipe{
    
    let id: Int
    let title, images, description, time  : String
    let ingredients: [Ingredient]
    
    init(title: String, images: String, description: String, time: String, ingredients:[Ingredient]) {
        self.id = 1
        self.description = description
        self.images = images
        self.time = time
        self.title = title
        self.ingredients = ingredients
    }
    
    
    
    //ingredients
    
    //content(Pages)
    
}
