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
    
    override func awakeFromNib() {
        RecipeImageView.layer.cornerRadius = 8
    }
    
    func configure(imageName:String, descricao:String){
        self.RecipeImageView.image = UIImage(named: imageName)
        self.DescriptionRecipe.text = descricao
    }
}

class PorcaoCell: UITableViewCell{

    @IBOutlet weak var PorcaoLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    
     func configure(tempo:Int?){
           self.PorcaoLabel.text = "porções"
        self.TimeLabel.text = "\(tempo ?? 0) min"
       }
    
}

class IngredientCell: UITableViewCell {

    
    
    @IBOutlet weak var IngredientNameLabel: UILabel!
    @IBOutlet weak var IngredientAmountLabel: UILabel!
    
    
    func configure(nome:String, quantidade:Float?, unidade:String?){
        self.IngredientNameLabel.text = nome
        if let quantidade = quantidade{
            self.IngredientAmountLabel.text = "\(String(format: "%.01f", quantidade)) \(unidade ?? " ")"
        }else{
            self.IngredientAmountLabel.text = "\(unidade ?? " ")"
        }
    }
}
