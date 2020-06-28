//
//  PerfilCollectionViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ConquistasCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    
    var id:Int?
    
     static let identifier = "PerfilCollectionViewCell"
  
    func configureCell(id:Int, imageName:String, titulo:String){
        
        self.id = id
        self.titulo.text = titulo
        self.image.layer.cornerRadius = 5
        
        let pont = Pontuation()
        
        if pont.verifyConquerId(id: id){
            self.image.image = UIImage(named: imageName)
        }else{
            self.image.image = UIImage(named: "closedConquer")
            self.image.contentMode = .scaleToFill
            self.image.backgroundColor = .systemBackground
        }
        
    }
    
 
}
