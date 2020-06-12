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
        
        for page in pages {
            
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            
            lastView = addImageToPage(pageViewController: viewController)
            lastView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 94).isActive = true
            
            let textView = addTextToPage(pageViewController: viewController, text: page.text)
            textView.topAnchor.constraint(equalTo:  lastView.bottomAnchor, constant: 12).isActive = true
            lastView = textView
            
            let chronometerView = addChronometerToPage(pageViewController: viewController, time: 10)!
            chronometerView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 12).isActive = true
            lastView = chronometerView
            
            
             pageViewControllers.append(viewController)
        }
    }
    
    
    func addImageToPage(pageViewController: UIViewController) -> UIView {
        
        let imageView = UIImageView()
        imageView.backgroundColor =  .red
        //imageView.frame.size = CGSize(width: 400, height: 148)
        pageViewController.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor, constant: 16).isActive = true
        imageView.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor, constant: -16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 132).isActive = true
        
        return imageView
    }
    
    
    func addChronometerToPage(pageViewController: UIViewController, time: Float) -> UIView? {
        
        if let chronometerView = Bundle.main.loadNibNamed("Chronometer", owner: self, options: nil)?.first as? ChronometerView {
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
    
}
