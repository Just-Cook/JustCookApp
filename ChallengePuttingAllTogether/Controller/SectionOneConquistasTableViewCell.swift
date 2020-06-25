//
//  SectionOneConquistasTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 25/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class SectionOneConquistasTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemView: UIImageView!
   
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var nivelLabel: UILabel!
    @IBOutlet weak var barraProgresso: UIProgressView!
    
    @IBOutlet weak var nivelLabelNumber: UILabel!
    
    @IBOutlet weak var nextLevelPontLabel: UILabel!
    
    let defauls = UserDefaults.standard
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier:String = "conquistasTableViewCellOne"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(){
        imagemView.layer.masksToBounds = true
        imagemView.contentMode = UIView.ContentMode.scaleAspectFill
        imagemView.layer.cornerRadius = imagemView.frame.height / 2
        imagemView.layer.backgroundColor = CGColor(srgbRed: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        imagemView.image = UIImage(named: " ")
  
        barraProgresso.layer.masksToBounds = true
        
        barraProgresso.layer.cornerRadius = 5
        barraProgresso.progressTintColor = UIColor.init(red: 43/255, green: 159/255, blue: 247/255, alpha: 1)
    

          let pontuation = Pontuation()
          nivelLabelNumber.text = String(pontuation.levelPontuation())
          nivelLabel.text = pontuation.nivelString()
          nextLevelPontLabel.text = "/  " + String(pontuation.getTotalNextLevel())
          nomeLabel.text = pontuation.levelNivelUserString()
          barraProgresso.progress = Float(pontuation.levelPontuation()) / Float(pontuation.getTotalNextLevel())
          
      }

}
