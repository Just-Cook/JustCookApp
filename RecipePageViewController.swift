//
//  RecipePageViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class RecipePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    let page1 = ViewController()
    let page2 = ViewController()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if(viewController.view.backgroundColor == .red) {
            return page1
        }else {
            return page2
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if(viewController.view.backgroundColor == .red) {
            return page1
        }else {
            return page2
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        page1.view = UIView()
        page1.view.backgroundColor = .blue
        
        page2.view = UIView()
        page2.view.backgroundColor = .red
        
        self.dataSource = self
        self.delegate = self
        
        setViewControllers([page1], direction: .forward, animated: false, completion: nil)
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
    
}
