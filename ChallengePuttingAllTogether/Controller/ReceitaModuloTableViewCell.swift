//
//  ReceitaModuloTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ReceitaModuloTableViewCell: UITableViewCell {

    @IBOutlet weak var backgReceita: UIImageView!
    
    @IBOutlet weak var receitaLabel: UILabel!
    
    @IBOutlet weak var tempoLabel: UILabel!
    
    @IBOutlet weak var checkBox: UIImageView!
    @IBOutlet weak var porcoesLabel: UILabel!
    @IBOutlet weak var porcoesIcon: UIImageView!
    @IBOutlet weak var timerIcon: UIImageView!
    
    @IBOutlet weak var viewBack: UIView!
    
    static let xibName = "receitaModulo" // Setando o nome da xib
    static let identifier = "receitaCell" // Setando o identificador da cell
       
    @IBOutlet weak var gradientView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tempoLabel.font = .systemFont(ofSize: 12, weight: .regular)
        porcoesLabel.font = .systemFont(ofSize: 12, weight: .regular)
        receitaLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        viewBack.layer.masksToBounds = true
        viewBack.layer.cornerRadius = 10
        backgReceita.layer.masksToBounds = true
        backgReceita.layer.cornerRadius = 10
        gradientView.layer.masksToBounds = true
        gradientView.layer.cornerRadius = 10
        
//        setando o gradiente
        let secondColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewBack.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, secondColor]
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        
    
    }
    func configure(id:Int, backImage:String, titulo:String, rendimento:Int, tempo:Int){
        
        let convertTempo = tempo/60
        self.backgReceita.image = UIImage(named: backImage)
        self.receitaLabel.text = titulo
        var porcoes = ""
        if rendimento == 1{
            porcoes = " porção"
        }else{
            porcoes = " porções"
            
        }
        self.porcoesLabel.text = "\(rendimento)" + porcoes
        self.tempoLabel.text = "\(convertTempo)" + " min"
        
        let pont = Pontuation()
        if pont.seIfRecipeIsComplete(id: id){
            checkBox.image = UIImage(named: "Concluido")
        }else{
            checkBox.image = UIImage(named: "NaoConcluido")
        }
        
    }

}
