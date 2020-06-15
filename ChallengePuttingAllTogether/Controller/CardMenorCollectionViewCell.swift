//
//  AprendaCollectionViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMenorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var wrapperView: UIView!
    
    @IBOutlet weak var backGroundImage: UIImageView!
    
    @IBOutlet weak var gradienteView: UIView!
    
    @IBOutlet weak var nivelImage: UIImageView!
    
    
    @IBOutlet weak var checkBoxImage: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    
    
    @IBOutlet weak var subtitulo: UILabel!
    
    
    
    static let nibName = "CardMenorCollectionViewCell"
    static let identifier = "CardMenorCollectionViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wrapperView.layer.masksToBounds = true
        wrapperView.layer.cornerRadius = 10
              
        backGroundImage.layer.masksToBounds = true
        backGroundImage.layer.cornerRadius = 10
              
        checkBoxImage.layer.masksToBounds = true
        checkBoxImage.layer.cornerRadius = checkBoxImage.frame.width / 2
              
        nivelImage.layer.masksToBounds = true
        nivelImage.layer.cornerRadius = 5
        nivelImage.contentMode = UIView.ContentMode.scaleAspectFit
              
        gradienteView.layer.masksToBounds = true
        gradienteView.layer.cornerRadius = 10
              
        let secondColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradienteView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, secondColor]
        gradienteView.layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
    static func xibForCollection() -> UINib{
          return UINib(nibName: nibName, bundle: nil)
      }
      
    
}