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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        
        
        let cvPages = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvPages.backgroundView = UIView()
        cvPages.backgroundView?.backgroundColor = .white
        cvPages.translatesAutoresizingMaskIntoConstraints = false
        cvPages.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        cvPages.delegate = self
        cvPages.dataSource = self
        
        self.view.addSubview(cvPages)
        
        cvPages.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        cvPages.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        cvPages.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cvPages.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
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
