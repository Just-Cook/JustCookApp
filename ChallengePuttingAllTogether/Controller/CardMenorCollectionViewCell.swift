//
//  AprendaCollectionViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMenorCollectionViewCell: UICollectionViewCell {
    
    static let nibName = "CardMenorCollectionViewCell"
    static let identifier = "CardMenorCollectionViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    static func xibForTable() -> UINib{
          return UINib(nibName: nibName, bundle: nil)
      }
      
    
}
