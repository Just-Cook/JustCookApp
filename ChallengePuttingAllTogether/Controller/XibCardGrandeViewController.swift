//
//  XibCardGrandeViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by David Augusto on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class XibCardGrandeViewController: UIViewController {

    
    @IBOutlet weak var CardGrande: UIView!
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyMod()
        
    }
    
    func applyMod() {
        //Boras arredondadas
        CardGrande.layer.cornerRadius = 10
        imageCard.layer.cornerRadius = 10
        
        //Gradient
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)]
        newLayer.frame = gradientView.frame
        gradientView.layer.addSublayer(newLayer)
        
        
    }
    
    

}
