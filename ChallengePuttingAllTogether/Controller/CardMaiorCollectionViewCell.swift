//
//  RecomendadoCollectionViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMaiorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var gradienteView: UIView!
    @IBOutlet weak var checkBoxImage: UIImageView!
    @IBOutlet weak var nivelImage: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subtitulo: UILabel!
    
    
    static let nibName = "CardMaiorCollectionViewCell"
    static let identifier = "CardMaiorCollectionViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        wrapperView.layer.masksToBounds = true
        wrapperView.layer.cornerRadius = 10
        
        backGroundImage.clipsToBounds = true
        backGroundImage.layer.cornerRadius = 10
              
        checkBoxImage.clipsToBounds = true
        checkBoxImage.layer.cornerRadius = checkBoxImage.frame.width / 2
              
        nivelImage.clipsToBounds = true
        nivelImage.layer.cornerRadius = 5
        nivelImage.contentMode = UIView.ContentMode.left
        
        //gradienteView.layer.masksToBounds = true
        //gradienteView.layer.cornerRadius = 10
        
        
              
          let secondColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)

          let gradientLayer = CAGradientLayer()
          gradientLayer.frame = wrapperView.bounds
//        gradienteView.backgroundColor = .red
            
        print(gradienteView.bounds)
        print(backGroundImage.frame)
        print(wrapperView.frame)
        
        
        
          gradientLayer.colors = [UIColor.clear.cgColor, secondColor]
          gradienteView.layer.insertSublayer(gradientLayer, at: 0)
//
    }
    
    
    static func xibForCollection() -> UINib{
          return UINib(nibName: nibName, bundle: nil)
      }
    
    func configureCard(backgroundImageName:String, titulo:String, subtitulo:String, nivel:Int){
           self.backGroundImage.image = UIImage(named: backgroundImageName)
           self.titulo.text = titulo
           self.subtitulo.text = subtitulo
           
           var nivelImage:String
           
           switch nivel {
           case 1:
               nivelImage = "muitofacil"
           case 2:
               nivelImage = "facil"
           case 3:
               nivelImage = "intermediario"
           default:
               nivelImage = "nenhum"
           }
           
           self.nivelImage.image = UIImage(named: nivelImage)
       }
    
}
