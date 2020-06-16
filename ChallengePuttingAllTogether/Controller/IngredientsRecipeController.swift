//
//  IngredientsRecipeController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class IngredientsRecipeController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Teste"
        self.navigationBar.prefersLargeTitles = true
        //self.navigationBar.pushItem(UINavigationItem(title: "TESTE"), animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        //self.isNavigationBarHidden = false
        
        let startRecipeButton = UIBarButtonItem(title: "Iniciar", style: .done, target: self, action: nil)

        self.setToolbarItems([startRecipeButton], animated: true)// = startRecipeButton
        //        startRecipeButton.tintColor = .orange
//        self.navigationItem.setRightBarButton(startRecipeButton, animated: true)
//        self.navigationItem.rightBarButtonItem = startRecipeButton
        
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
