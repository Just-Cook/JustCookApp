//
//  CongratsScreenViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 23/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
import Lottie

class CongratsScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        showCongratScreen(points: 100)
        // Do any additional setup after loading the view.
    }
    
    
    func showCongratScreen(points: Int ){
            
            //let viewController = UIViewController()
            let centeredView = UIView() //viewController.view!
            self.view.backgroundColor = .white
            //recipeView.present(self, animated: true, completion: nil)
            
            
            self.view.addSubview(centeredView)
            
            centeredView.translatesAutoresizingMaskIntoConstraints = false
            centeredView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            centeredView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            centeredView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
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

            self.view.addSubview(congratTitleLabel)

            congratTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            congratTitleLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor).isActive = true
            //congratTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140).isActive = true
            congratTitleLabel.topAnchor.constraint(equalTo: centeredView.topAnchor, constant: 0).isActive = true
            congratTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            
            
            let congratDescriptionLabel = UILabel()
            congratDescriptionLabel.text = "Você concluiu sua receita!"
            congratDescriptionLabel.font = congratDescriptionLabel.font.withSize(20)
            congratDescriptionLabel.textAlignment = .center

            self.view.addSubview(congratDescriptionLabel)

            congratDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            congratDescriptionLabel.topAnchor.constraint(equalTo: congratTitleLabel.bottomAnchor, constant: 8).isActive = true
            congratDescriptionLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -16).isActive = true
            congratDescriptionLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 16).isActive = true
            
            
            let animationView = AnimationView()
            animationView.animation = Animation.named("Bolo Path")
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .playOnce
            animationView.play()
            
            //animationView.backgroundColor = .red
            
            centeredView.addSubview(animationView)
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            animationView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 16).isActive = true
            animationView.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -16).isActive = true
            animationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
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
            continueButton.backgroundColor = .orangeColor
            continueButton.layer.cornerRadius = 8
            continueButton.addTarget(self, action: #selector(continueButtonAction), for: .touchUpInside)
            
            centeredView.addSubview(continueButton)
            continueButton.translatesAutoresizingMaskIntoConstraints = false
            continueButton.topAnchor.constraint(equalTo: morePointsLabel.bottomAnchor, constant: 24).isActive = true
            continueButton.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor, constant: 0).isActive = true
            continueButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
            continueButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
            
        }
        
        @objc
        func continueButtonAction(){
            self.dismiss(animated: true, completion: {self.dismiss(animated: true, completion: nil)})
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
