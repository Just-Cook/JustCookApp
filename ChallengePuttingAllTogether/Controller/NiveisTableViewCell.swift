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
        
        let pont = Pontuation()
        
        wrapperView.layer.masksToBounds = true
        wrapperView.layer.cornerRadius = 10
        
        self.titulo.text = pont.nivelString() + " - " + pont.levelNivelUserString()
        
        switch pont.userLevelNumber() {
        case 1:
            wrapperView.backgroundColor = .blueColor
            imagem.image = UIImage(named: "icone-nivel1")
            heightNivel.constant = 45
            widthNivel.constant = 26
            self.descricao.text = "Olá jovem cozinheiro! Neste nível você provavelmente só sabe fazer miojo, mas sua jornada na cozinha já começou!"
        case 2:
            wrapperView.backgroundColor = .greenColor
            imagem.image = UIImage(named: "icone-nivel2")
            heightNivel.constant = 39
            widthNivel.constant = 29
            self.descricao.text = "Olá jovem cozinheiro! Neste nível você já consegue fazer algumas receitas fáceis, e olha so! Sua mãe está orgulhosa."
            
        case 3:
            wrapperView.backgroundColor = .redColor
            imagem.image = UIImage(named: "icone-nivel3")
            heightNivel.constant = 35
            widthNivel.constant = 35
            self.descricao.text = "Olá jovem cozinheiro! Neste nível você consegue fazer receitas mais elaboradas e já pode chamar os amigos para um jantar na sua casa."
            
        default:
            wrapperView.backgroundColor = .blueColor
        }
        
//        imagem.contentMode = UIView.ContentMode.scaleAspectFill
//        imagem.layer.masksToBounds = true
//        imagem.layer.cornerRadius = 8
    }
    
    
    static func xibForTable() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
    

    
}
