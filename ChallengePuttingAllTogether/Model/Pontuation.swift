//
//  Pontuation.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 17/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit

class Pontuation {
    
    let defauls = UserDefaults.standard
    static var nav: UINavigationController?
    
    func getTotalNextLevel() -> Int{
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return 100
        case 100..<200:
            return 100
        default:
            return 200
        }
        
    }
    
    func levelPontuation() -> Int {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return totalPontuation
        case 100..<200:
            return totalPontuation - 100
        default:
            return totalPontuation - 200
        }
    }
    
    func nivelString() -> String {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return "Nivel 1"
        case 100..<200:
            return "Nivel 2"
        default:
            return "Nivel 3"
        }
        
    }
    
    func levelNivelUserString() -> String {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return "Profissional do Miojo"
        case 100..<200:
            return "Orgulho da Mamae"
        default:
            return "Eu sou a Lenda"
        }
    }
    
    func increasePontuation(in num: Int){
        
        var currentPontuation = defauls.integer(forKey: "totalPontuation")
        currentPontuation = currentPontuation + num
       
        defauls.set(currentPontuation, forKey: "totalPontuation")
    }

    func decreasePontuation(in num: Int){
        
        var currentPontuation = defauls.integer(forKey: "totalPontuation")
        currentPontuation = currentPontuation - num
       
        defauls.set(currentPontuation, forKey: "totalPontuation")
    }
    
    
    func showCongratScreen(recipeView: UIViewController, points: Int ){
        
        let viewController = UIViewController()
        let centeredView = UIView() //viewController.view!
        viewController.modalPresentationStyle = .fullScreen
        viewController.view.backgroundColor = .white
        recipeView.present(viewController, animated: true, completion: nil)
        
        
        viewController.view.addSubview(centeredView)
        
        centeredView.translatesAutoresizingMaskIntoConstraints = false
        centeredView.leadingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        centeredView.trailingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        centeredView.centerYAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        centeredView.heightAnchor.constraint(equalToConstant: 480).isActive = true
        
        //Pontuation.nav!.present(viewController, animated: true, completion: nil)
        
//        let closeButton = UIButton()
//        closeButton.backgroundColor = .orange
//        viewController.view.addSubview(closeButton)
//
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
//        closeButton.topAnchor.constraint(equalToSystemSpacingBelow: viewController.view.safeAreaLayoutGuide.topAnchor, multiplier: 8).isActive = true
//        closeButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
//        closeButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        
        let congratTitleLabel = UILabel()
        congratTitleLabel.text = "Parabéns"
        congratTitleLabel.textAlignment = .center
        congratTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)//congratTitleLabel.font.withSize(24)

        viewController.view.addSubview(congratTitleLabel)

        congratTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        congratTitleLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor).isActive = true
        //congratTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140).isActive = true
        congratTitleLabel.topAnchor.constraint(equalTo: centeredView.topAnchor, constant: 0).isActive = true
        congratTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        let congratDescriptionLabel = UILabel()
        congratDescriptionLabel.text = "Você concluiu sua receita!"
        congratDescriptionLabel.font = congratDescriptionLabel.font.withSize(20)
        congratDescriptionLabel.textAlignment = .center

        viewController.view.addSubview(congratDescriptionLabel)

        congratDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        congratDescriptionLabel.topAnchor.constraint(equalTo: congratTitleLabel.bottomAnchor, constant: 8).isActive = true
        congratDescriptionLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -16).isActive = true
        congratDescriptionLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 16).isActive = true
        
        
        let animationView = UIView()
        animationView.backgroundColor = .red
        
        centeredView.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 16).isActive = true
        animationView.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -16).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        animationView.topAnchor.constraint(equalTo: congratDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        
        
        let morePointsLabel = UILabel()
        morePointsLabel.text = "+ \(String(points)) pontos"
        morePointsLabel.textAlignment = .center
        
        centeredView.addSubview(morePointsLabel)
        
        morePointsLabel.translatesAutoresizingMaskIntoConstraints = false
        morePointsLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor, constant: 0).isActive = true
        morePointsLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -16).isActive = true
        morePointsLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 16).isActive = true
        morePointsLabel.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 16).isActive = true
        
        
        let continueButton = UIButton()
        continueButton.setTitle("Continuar", for: .normal)
        continueButton.backgroundColor = .orange
        continueButton.layer.cornerRadius = 8
        
        centeredView.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.topAnchor.constraint(equalTo: morePointsLabel.bottomAnchor, constant: 24).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor, constant: 0).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    
}
