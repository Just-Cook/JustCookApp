//
//  PreparacaoCollectionViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class PreparacaoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgPreparacao: UIImageView!
    @IBOutlet weak var labelPreparacao: UILabel!
    @IBOutlet weak var checkPreparacao: UIImageView!
   
      
    static let xibName = "Preparacao" // Setando o nome da xib
    static let identifier = "PreparacaoCell" // Setando o identificador da cell
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
