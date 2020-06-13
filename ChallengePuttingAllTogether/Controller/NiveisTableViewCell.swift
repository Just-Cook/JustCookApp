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
    
    static let nibName = "NiveisTableViewCell"
    static let identifier = "NiveisTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.wrapperView.layer.masksToBounds = true
        self.wrapperView.layer.cornerRadius = 8
        self.wrapperView.layer.backgroundColor = CGColor.init(srgbRed: 36/255, green: 153/255, blue: 242/255, alpha: 1)
        
        
//        imagem.contentMode = UIView.ContentMode.scaleAspectFill
//        imagem.layer.masksToBounds = true
//        imagem.layer.cornerRadius = 8
    }
    
    
    static func xibForTable() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
    

    
}
