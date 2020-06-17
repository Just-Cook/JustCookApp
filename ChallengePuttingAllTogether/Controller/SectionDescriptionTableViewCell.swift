//
//  SectionDescriptionTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class SectionDescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var descriptionModulo: UITextView!
    static var identifier = "descripCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        content.backgroundColor = .blue
        descriptionModulo.text = "la la la shuyduydubdbu ndhhubuhbduhbhub suhubdhbhbdhfbhh dnaicm njznizc"
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
