//
//  PefilViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 11/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class PefilViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var nivelLabel: UILabel!
    

    @IBOutlet weak var nivelLabelNumber: UILabel!
    
    @IBOutlet weak var barraProgresso: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()

        image.layer.masksToBounds = true
         image.contentMode = UIView.ContentMode.scaleAspectFill
         image.layer.cornerRadius = image.frame.width / 2
         image.layer.backgroundColor = CGColor(srgbRed: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        
         barraProgresso.layer.masksToBounds = true
         barraProgresso.layer.cornerRadius = 5
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
