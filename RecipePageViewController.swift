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
    var chronometerView: ChronometerView?
    
    let pages:[Page] = [
        Page(text: "Texto da Pagina 1", chronometer: 1200, links: nil, smallImage: "Tem", bigImage: nil, video: nil),
        Page(text: "Texto da Pagina 2", chronometer: nil, links: nil, smallImage: nil, bigImage: "tem sim", video: nil),
        Page(text: "Texto da Pagina 3", chronometer: nil, links: nil, smallImage: nil, bigImage: "tem sim", video: nil),
        Page(text: "Texto da Pagina 4", chronometer: nil, links: nil, smallImage: nil, bigImage: "tem sim", video: nil),
        Page(text: "Texto da Pagina 5", chronometer: 1200, links: nil, smallImage: "Tem", bigImage: nil, video: nil),
        Page(text: "Texto da Pagina 6", chronometer: 6400, links: nil, smallImage: "Tem", bigImage: nil, video: nil),
        Page(text: "Texto da Pagina 7", chronometer: nil, links: nil, smallImage: nil, bigImage: "tem sim", video: nil),
        Page(text: "Texto da Pagina 8", chronometer: nil, links: nil, smallImage: nil, bigImage: "tem sim", video: nil),
        Page(text: "Texto da Pagina 9", chronometer: nil, links: nil, smallImage: nil, bigImage: "tem sim", video: nil)
        
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
