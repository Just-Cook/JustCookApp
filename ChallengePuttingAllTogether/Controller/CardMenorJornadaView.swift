//
//  CardMenorJornadaView.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMenorJornadaView: UIView {

    
  
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var imageCheckBox: UIImageView!
    @IBOutlet weak var imageNivel: UIImageView!
    @IBOutlet weak var subtitulo: UILabel!
    
    
    
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
        self.secondView.layer.cornerRadius = 8
        self.imageBackground.layer.cornerRadius = 8
        self.imageCheckBox.layer.cornerRadius = imageCheckBox.frame.width / 2
        self.imageNivel.layer.cornerRadius = 5
    }

}
