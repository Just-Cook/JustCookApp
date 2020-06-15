//
//  ImageDescriptionCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ImageDescriptionCell: UITableViewCell {
    
    @IBOutlet weak var RecipeImageView: UIImageView!
    @IBOutlet weak var DescriptionRecipe: UITextView!
}

class PorcaoCell: UITableViewCell{

    @IBOutlet weak var PorcaoLabel: UILabel!
    
}

class IngredientCell: UITableViewCell {

    @IBOutlet weak var IngredientNameLabel: UILabel!
    @IBOutlet weak var IngredientAmountLabel: UILabel!
}
