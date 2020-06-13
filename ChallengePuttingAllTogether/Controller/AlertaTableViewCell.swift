//
//  AlertaTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class AlertaTableViewCell: UITableViewCell {

    @IBOutlet weak var wrapperView: UIView!
    
    @IBOutlet weak var texto: UILabel!
    
    
    static let nibName = "AlertaTableViewCell"
    static let identifier = "AlertaTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.wrapperView.layer.masksToBounds = true
        self.wrapperView.layer.cornerRadius = 10
        self.wrapperView.layer.backgroundColor = CGColor.init(srgbRed: 248/255, green: 162/255, blue: 52/255, alpha: 1)
     
    }

  
     static func xibForTable() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }

}
