//
//  NiveisCollectionViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class NiveisTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wrapperView: UIView!
    
    @IBOutlet weak var imagem: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var descricao: UILabel!
    
    @IBOutlet weak var heightNivel: NSLayoutConstraint!
    
    @IBOutlet weak var widthNivel: NSLayoutConstraint!
    
    
    static let nibName = "NiveisTableViewCell"
    static let identifier = "NiveisTableViewCell"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
      
        wrapperView.layer.masksToBounds = true
        wrapperView.layer.cornerRadius = 10
     
    
    }
    
    func configure(){
        let pont = Pontuation()
        let level = pont.userLevelNumber()
      //  pont.zeraPontuation()
        
         self.titulo.text = pont.nivelString() + " - " + pont.levelNivelUserString()
           
          wrapperView.backgroundColor = getBackgroundColor(level)
          imagem.image = UIImage(named: getImageIcon(level))
          heightNivel.constant = CGFloat(getHeightConstraint(level))
          widthNivel.constant = CGFloat(getWidhtConstraint(level))
          self.descricao.text = getDescricao(level)
        
    }
    
    private func getImageIcon(_ level:Int)->String{
        switch level {
        case 1:
            return "icone-nivel1"
        case 2:
            return "icone-nivel2"
        case 3:
            return "icone-nivel3"
        default:
            return " "
        }
            
    }

    private func getBackgroundColor(_ level:Int)->UIColor{
      
        switch level {
        case 1:
            return .blueColor
        case 2:
            return .greenColor
        case 3:
            return .redColor
        default:
            return .blueColor
            
        }
        
    }
    
    private func getHeightConstraint(_ level:Int)->Int{
      
        switch level {
        case 1:
            return 45
        case 2:
            return 39
        case 3:
            return 35
        default:
            return 45
            
        }
    }

    private func getWidhtConstraint(_ level:Int)->Int{

        switch level {
        case 1:
            return 26
        case 2:
            return 29
        case 3:
            return 35
        default:
            return 26
            
        }
    }
    
    
    private func getDescricao(_ level:Int)->String{
     
        switch level {
        case 1:
            return "Olá jovem cozinheiro! Neste nível você provavelmente só sabe fazer miojo, mas sua jornada na cozinha já começou!"
        case 2:
            return "Olá jovem cozinheiro! Neste nível você já consegue fazer algumas receitas fáceis, e olha so! Sua mãe está orgulhosa."
        case 3:
            return "Olá jovem cozinheiro! Neste nível você consegue fazer receitas mais elaboradas e já pode chamar os amigos para um jantar na sua casa."
        default:
            return "Olá jovem cozinheiro! Neste nível você provavelmente só sabe fazer miojo, mas sua jornada na cozinha já começou!"
            
        }
    }
    static func xibForTable() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
    

    
}
