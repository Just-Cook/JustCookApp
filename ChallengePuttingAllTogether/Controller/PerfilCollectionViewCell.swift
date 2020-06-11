//
//  PerfilCollectionViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class PerfilCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    
     static let identifier = "PerfilCollectionViewCell"
    
    
    func configureCell(imageName:String, titulo:String){
        self.image.image = UIImage(named: imageName)
        self.titulo.text = titulo
        
        self.image.layer.cornerRadius = 5
        
        
        
    }
   
}
