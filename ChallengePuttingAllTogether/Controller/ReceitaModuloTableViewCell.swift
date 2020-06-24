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
    
    @IBOutlet weak var viewBackg: UIView!
    
    
    @IBOutlet weak var porcoesIcon: UIImageView!
    @IBOutlet weak var timerIcon: UIImageView!
    
    static let xibName = "receitaModulo" // Setando o nome da xib
    static let identifier = "receitaCell" // Setando o identificador da cell
       
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func configure(backImage:String, titulo:String, rendimento:Int, tempo:Int){
        
        self.backgReceita.image = UIImage(named: backImage)
        self.receitaLabel.text = titulo
        self.porcoesLabel.text = "\(rendimento)"
        self.tempoLabel.text = "\(tempo)"
        
        
        
    }

}
