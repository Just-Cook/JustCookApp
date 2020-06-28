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
    var addedGradient = false
    
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
     
        
        
    }
    
    
    static func xibForCollection() -> UINib{
          return UINib(nibName: nibName, bundle: nil)
      }
    
    func configureCard(id: Int, backgroundImageName:String, titulo:String, subtitulo:String, nivel:Int){
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
        
            let pont = Pontuation()
        
            if pont.seeIfModuleIsCompleted(moduleId: id){
                self.checkBoxImage.image = UIImage(named: "Concluido")
            }else{
                self.checkBoxImage.image = UIImage(named: "NaoConcluido")
            }
            
       }
    
    public func configuraGradient(size: CGSize){
        
        if !self.addedGradient {
        
            let secondColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
                        
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.clear.cgColor, secondColor]
            gradientLayer.locations = [0.0, 1.0]
            
            gradientLayer.frame = CGRect(origin: .zero, size: size)
            
            gradienteView.layer.insertSublayer(gradientLayer, at: 0)
            self.addedGradient = true
        }
    }
    
}
