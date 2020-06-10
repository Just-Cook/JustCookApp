//
//  RecipePageViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class RecipePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    var pageViewControllers:[UIViewController] = []
    
    let pages:[Page] = [
        Page(text: "Pagina 1 da receita"),
        Page(text: "Pagina 2 da receita"),
        Page(text: "Pagina 3 da receita"),
        Page(text: "Pagina 4 da receita"),
        Page(text: "Pagina 5 da receita"),
        Page(text: "Pagina 6 da receita"),
        Page(text: "Pagina 7 da receita"),
        Page(text: "Pagina 8 da receita")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        createViewControllers()
        
        if let firstPageViewController = pageViewControllers.first{
            setViewControllers([firstPageViewController], direction: .forward, animated: false, completion: nil)
        }
        
        
        configurePagination()
    }
    
    func configurePagination(){
        let topView = UIView()
        topView.backgroundColor = .darkGray
        
        self.view.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 78).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    
    func createViewControllers(){
        
        for page in pages {
            
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            let textView = UITextView()
            textView.isEditable = false
            textView.text = page.text
            viewController.view.addSubview(textView)
            
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: 0).isActive = true
            textView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: 0).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            textView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 94).isActive = true
            
            pageViewControllers.append(viewController)
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController) else { return nil }
        
        let beforeIndex = currentIndex - 1
        
        guard beforeIndex >= 0 else {
            return nil
        }
        
        return pageViewControllers[beforeIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController) else { return nil }
        
        let afterIndex = currentIndex + 1
        
        guard afterIndex <= pageViewControllers.count - 1 else {
            return nil
        }
        
        return pageViewControllers[afterIndex]
        
    }
    
}
