//
//  AlertaXib.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class AlertaXib: UIView {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    
    
    override func draw(_ rect: CGRect) {
               self.layer.cornerRadius = 8
               self.layer.backgroundColor = CGColor.init(srgbRed: 248/255, green: 162/255, blue: 52/255, alpha: 1)
          }

          
          var contentView: UIView?
          var xibName = "Alerta"
            
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
                configureXibNivel()
            }
            
            private func loadViewFromNib() -> UIView?{
                let bundle = Bundle(for: type(of: self))
                let nib = UINib(nibName: xibName, bundle: bundle)
                return nib.instantiate(withOwner: self, options: nil).first as? UIView
            }
            
            
            func configureXibNivel(){
           //   image.clipsToBounds = true
            //    image.layer.cornerRadius = 8

            }
       


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
