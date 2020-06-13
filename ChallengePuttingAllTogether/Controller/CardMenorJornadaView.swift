//
//  CardMenorJornadaView.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMenorJornadaView: UIView {

    
  
    var imageBackground: UIImageView!
    var secondView: UIView!
    
    var titulo: UILabel!
    var imageCheckBox: UIImageView!
    var imageNivel: UIImageView!
    var subtitulo: UILabel!
    
    
    
    override func draw(_ rect: CGRect) {
       
        self.layer.cornerRadius = 8
       
    }
    
    
    var contentView: UIView?
    var xibName = "CardMenorJornadaView"
    
    required init?(coder aDecoder:NSCoder) {
          super.init(coder: aDecoder)
       
          setupXib()
          
      }
    
    private func setupXib(){
        guard let view = loadViewFromNib()
            else{ fatalError("Wrong xib name")}
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        configureXibCardMenorJornada()
    }
    
    private func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: xibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    
    func configureXibCardMenorJornada(){
        
        secondView.clipsToBounds = true
        secondView.layer.cornerRadius = 8
        
        imageBackground.clipsToBounds = true
        imageBackground.layer.cornerRadius = 8
        
        imageCheckBox.clipsToBounds = true
        imageCheckBox.layer.cornerRadius = imageCheckBox.frame.width / 2
        
        imageNivel.clipsToBounds = true
        imageNivel.layer.cornerRadius = 5
        imageNivel.contentMode = UIView.ContentMode.scaleAspectFit
        
        
        
        let secondColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
              
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = secondView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, secondColor]
        secondView.layer.insertSublayer(gradientLayer, at: 0)
    }

}
