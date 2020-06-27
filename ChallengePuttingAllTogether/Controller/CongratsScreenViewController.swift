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

    
    var oldPontuation: Int?
    var newPontuation: Int?
    var points: Int?
    
    func configure(oldPontuation: Int, newPontuation: Int){
        self.oldPontuation = oldPontuation
        self.newPontuation = newPontuation
        self.points = newPontuation - oldPontuation
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        showCongratScreen()
    }
    
    var centerAnchor1: NSLayoutConstraint?
    var centerAnchor2: NSLayoutConstraint?
    
    var progressBar: UIProgressView?
    
    func showCongratScreen(){
        
            let pont = Pontuation()
            let centeredView = UIView()
            self.view.backgroundColor = .white
            
            
            self.view.addSubview(centeredView)
            
            centeredView.translatesAutoresizingMaskIntoConstraints = false
            centeredView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            centeredView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            centeredView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
            centeredView.heightAnchor.constraint(equalToConstant: 480).isActive = true
            
            let congratTitleLabel = UILabel()
            congratTitleLabel.text = "Parabéns"
            congratTitleLabel.textAlignment = .center
            congratTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)

            self.view.addSubview(congratTitleLabel)

            congratTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            congratTitleLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor).isActive = true
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
            animationView.play{(finished) in
                self.playAnimation()
            }
            
            centeredView.addSubview(animationView)
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            animationView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 16).isActive = true
            animationView.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -16).isActive = true
            animationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            animationView.topAnchor.constraint(equalTo: congratDescriptionLabel.bottomAnchor, constant: 16).isActive = true
            
            
            let morePointsLabel = UILabel()
            morePointsLabel.text = "+ \(String(points!)) pontos"
            morePointsLabel.textAlignment = .center
            
            centeredView.addSubview(morePointsLabel)
            
            morePointsLabel.translatesAutoresizingMaskIntoConstraints = false
            morePointsLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor, constant: 0).isActive = true
            morePointsLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -16).isActive = true
            morePointsLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 16).isActive = true
            morePointsLabel.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 16).isActive = true
            
                
            let animatedProgressBar = UIProgressView()
            animatedProgressBar.progress = Float(pont.levelPontuation(points: self.oldPontuation!))/Float(pont.getTotalNextLevel())
            animatedProgressBar.layer.masksToBounds = true
            animatedProgressBar.layer.cornerRadius = 5
            animatedProgressBar.progressTintColor = UIColor.init(red: 43/255, green: 159/255, blue: 247/255, alpha: 1)
            
//            pont.increasePontuation(in: points)
//            pont.completConquer(id: 1)
        
            self.progressBar = animatedProgressBar
        
            centeredView.addSubview(animatedProgressBar)
            animatedProgressBar.translatesAutoresizingMaskIntoConstraints = false
            animatedProgressBar.topAnchor.constraint(equalTo: morePointsLabel.bottomAnchor, constant: 12).isActive = true
            animatedProgressBar.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor, constant: 0).isActive = true
            animatedProgressBar.widthAnchor.constraint(equalToConstant: 230).isActive = true
            animatedProgressBar.heightAnchor.constraint(equalToConstant: 14).isActive = true
            
        
            let continueButton = UIButton()
            continueButton.setTitle("Continuar", for: .normal)
            continueButton.backgroundColor = .orangeColor
            continueButton.layer.cornerRadius = 8
            continueButton.addTarget(self, action: #selector(continueButtonAction), for: .touchUpInside)
            
            centeredView.addSubview(continueButton)
            continueButton.translatesAutoresizingMaskIntoConstraints = false
            continueButton.topAnchor.constraint(equalTo: animatedProgressBar.bottomAnchor, constant: 24).isActive = true
            continueButton.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor, constant: 0).isActive = true
            continueButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
            continueButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
            
        }
        
        @objc
        func continueButtonAction(){
            self.dismiss(animated: true, completion: {self.dismiss(animated: true, completion: nil)})
       }
    
    
    func playAnimation(){
        let pont = Pontuation()
        var progress = Float(pont.levelPontuation(points: self.newPontuation!))/Float(pont.getTotalNextLevel())
        
        if(pont.userLevelNumber(points: oldPontuation!) != pont.userLevelNumber(points: newPontuation!)){
          progress = 1
          print("Parabens, voce subiu de Nivel")
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.progressBar?.setProgress(progress, animated: true)
        })
    }
}
