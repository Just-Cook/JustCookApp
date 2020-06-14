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
            
            
            if let bigImage = page.bigImage{
                lastView = addBigImageToPage(pageViewController: viewController, image: bigImage)
                lastView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 112).isActive = true
            }
            
            if let smallImage = page.smallImage{
                lastView = addSmallImageToPage(pageViewController: viewController, image: smallImage)
                lastView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 112).isActive = true
            }
            
            let text = page.text
            let textView = addTextToPage(pageViewController: viewController, text: text)
            textView.topAnchor.constraint(equalTo:  lastView.bottomAnchor, constant: 12).isActive = true
            lastView = textView
            
//            if let links = page.links{
//
//
//            }
            
            if let chronometer = page.chronometer {
                let chronometerView = addChronometerToPage(pageViewController: viewController, seconds: chronometer)!
                chronometerView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 12).isActive = true
                lastView = chronometerView
            }
            
//            if let video = page.video {
//
//
//            }
            
             pageViewControllers.append(viewController)
        }
    }
    
    
    func addSmallImageToPage(pageViewController: UIViewController, image:String) -> UIView {
        
        let imageView = UIImageView()
        imageView.backgroundColor =  .red
        imageView.layer.cornerRadius = 16
        pageViewController.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor, constant: 16).isActive = true
        imageView.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor, constant: -16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 132).isActive = true
        
        return imageView
    }
    
    func addBigImageToPage(pageViewController: UIViewController, image:String) -> UIView {
        
        let imageView = UIImageView()
        imageView.backgroundColor =  .red
        imageView.layer.cornerRadius = 16
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
