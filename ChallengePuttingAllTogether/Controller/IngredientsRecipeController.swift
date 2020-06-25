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
        Pontuation.nav = self.navigationController

        self.navigationBar.prefersLargeTitles = true
        
    }

}
