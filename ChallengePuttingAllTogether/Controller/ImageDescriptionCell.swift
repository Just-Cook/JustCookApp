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
    
    func adjustHeightOfDescription() -> CGFloat {
        DescriptionRecipe.translatesAutoresizingMaskIntoConstraints = false
        DescriptionRecipe.sizeToFit()
        DescriptionRecipe.isScrollEnabled = false
        return DescriptionRecipe.frame.height + RecipeImageView.frame.size.height + 32
    }
}

class PorcaoCell: UITableViewCell{

    @IBOutlet weak var PorcaoLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    
}

class IngredientCell: UITableViewCell {

    @IBOutlet weak var IngredientNameLabel: UILabel!
    @IBOutlet weak var IngredientAmountLabel: UILabel!
}
