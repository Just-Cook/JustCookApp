//
//  RecipePagesCreation.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit

extension RecipePageViewController {
    
    
    
    func createViewControllers(){
        
        var lastView: UIView = self.view
        
        var pageCount = 1
        
        for page in pages {
            
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
           
           
            lastView = addSmallImageToPage(pageViewController: viewController, image: page.imageName)
                lastView.topAnchor.constraint(equalTo: viewController.view.layoutMarginsGuide.topAnchor, constant: 74).isActive = true
            
            
            let text = page.descricao
            let textView = addTextToPage(pageViewController: viewController, text: text)
            textView.topAnchor.constraint(equalTo:  lastView.bottomAnchor, constant: 12).isActive = true
            lastView = textView
 
            
            if let chronometer = page.cronometro {
                let chronometerView = addChronometerToPage(pageViewController: viewController, seconds: chronometer)!
                chronometerView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 12).isActive = true
                lastView = chronometerView
            }
 
            
            if let tip = page.tip {
                let tipView = addTip(pageViewController: viewController, tipText: tip)
                tipView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 12).isActive = true
                lastView = tipView
            }
            
            if (pageCount == pages.count){
                
                let finalizeButton = addFinalizeButton(pageViewController: viewController)
                finalizeButton.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 12).isActive = true
            }
            
             pageViewControllers.append(viewController)
            
            pageCount = pageCount + 1
        }
    }
    
    
    func addSmallImageToPage(pageViewController: UIViewController, image:String) -> UIView {
        
        let imageView = UIImageView()
  
        imageView.image = UIImage(named: image)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        pageViewController.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor, constant: 16).isActive = true
        imageView.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor, constant: -16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 132).isActive = true
        
        return imageView
    }
    
    func addBigImageToPage(pageViewController: UIViewController, image:String) -> UIView {
        
        let imageView = UIImageView()
     
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.image = #imageLiteral(resourceName: "woman-chef")
        
        pageViewController.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor, constant: 16).isActive = true
        imageView.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor, constant: -16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        return imageView
    }
    
    
    func addChronometerToPage(pageViewController: UIViewController, seconds: Int) -> UIView? {
        
        if let chronometerView = Bundle.main.loadNibNamed("Chronometer", owner: self, options: nil)?.first as? ChronometerView {
            
            self.chronometerView = chronometerView
            self.chronometerView!.ready(seconds: seconds)
            
            pageViewController.view.addSubview(chronometerView)
            chronometerView.translatesAutoresizingMaskIntoConstraints = false
            chronometerView.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor, constant: 0).isActive = true
            chronometerView.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor, constant: 0).isActive = true
            chronometerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            return chronometerView
        }
    
        return nil
    }
    
    
    func addTextToPage(pageViewController: UIViewController, text: String) -> UIView {
        
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 17)
        textView.text = text
        
        pageViewController.view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor, constant: 16).isActive = true
        textView.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor, constant: -16).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return textView
    }
    
    
    
    func addFastLinksToPage(){
        
        
    }
    
    func addFinalizeButton(pageViewController: UIViewController) -> UIButton {
        
        let finalizeButton = UIButton()
        
        finalizeButton.setTitle("Finalizar Receita", for: .normal)
        finalizeButton.backgroundColor = .orangeColor
        
        finalizeButton.layer.cornerRadius = 8
        
        pageViewController.view.addSubview(finalizeButton)
        
        finalizeButton.translatesAutoresizingMaskIntoConstraints = false
        finalizeButton.centerXAnchor.constraint(equalTo: pageViewController.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        finalizeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        finalizeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        finalizeButton.addTarget(self, action: #selector(goToCongats), for: .touchUpInside)
        
        return finalizeButton
    }
    
    func addTip(pageViewController: UIViewController, tipText: String) -> UIView {
        
        let tipView = UIView()
        tipView.backgroundColor = .weakBlueColor
        tipView.layer.cornerRadius = 8
        
        let fastTipLabel = UILabel()
        fastTipLabel.text = "Dica Rapida"
        fastTipLabel.font = UIFont.systemFont(ofSize: 12)
        tipView.addSubview(fastTipLabel)
        fastTipLabel.translatesAutoresizingMaskIntoConstraints = false
        fastTipLabel.leadingAnchor.constraint(equalTo: tipView.leadingAnchor, constant: 8).isActive = true
        fastTipLabel.topAnchor.constraint(equalTo: tipView.topAnchor, constant: 8).isActive = true
        
        let tipLabel = UILabel()
        tipLabel.text = tipText
        tipLabel.font = UIFont.systemFont(ofSize: 15)
        tipLabel.numberOfLines = 0
        tipView.addSubview(tipLabel)
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.leadingAnchor.constraint(equalTo: fastTipLabel.leadingAnchor, constant: 0).isActive = true
        tipLabel.trailingAnchor.constraint(equalTo: tipView.trailingAnchor, constant: -8).isActive = true
        tipLabel.topAnchor.constraint(equalTo: fastTipLabel.bottomAnchor, constant: 4).isActive = true
        
        pageViewController.view.addSubview(tipView)
        tipView.translatesAutoresizingMaskIntoConstraints = false
        tipView.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor, constant: 16).isActive = true
        tipView.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor, constant: -16).isActive = true
        tipView.bottomAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: 8).isActive = true
        
        return tipView
        
    }
    
    @objc
    func goToCongats(){
        
        let pont = Pontuation()
        
        let oldPontuation = pont.getTotalPoints()
        let newPontuation = pont.increasePontuation(in: 75)
        //pont.saveCompletedRecipe(id: self.receitaId!)
        pont.finalizeRecipe(recipeId: self.receitaId!)
     
        let congrat = CongratsScreenViewController()
        
        congrat.configure(oldPontuation: oldPontuation, newPontuation: newPontuation)
        
        self.present(congrat, animated: true, completion: nil )
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
