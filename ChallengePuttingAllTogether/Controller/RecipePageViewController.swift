//
//  RecipePageViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class RecipePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
//    
//    let pages:[Page] = [
//        Page(id: 1, descricao: "Texto da Pagina 1", imageName: "Tem", cronometro: 1200),
//       Page(id: 2, descricao: "Texto da Pagina 1", imageName: "Tem", cronometro: 1200),
//     Page(id: 3, descricao: "Texto da Pagina 1", imageName: "Tem", cronometro: 1200),
//      Page(id: 4, descricao: "Texto da Pagina 1", imageName: "Tem", cronometro: 1200),
//       Page(id: 5, descricao: "Texto da Pagina 1", imageName: "Tem", cronometro: 1200)
//      ]

    var pageViewControllers:[UIViewController] = []
    var chronometerView: ChronometerView?
    var paginationCV: UICollectionView?
    var currentPage = 0
  
    
    //selectedPageViewController : UIPageViewController?
    
    var receitaId: Int?
    var pages:[Page] = []{
        didSet{
              DispatchQueue.main.async {
                self.paginationCV?.reloadData()
                self.createViewControllers()
                if let firstPageViewController = self.pageViewControllers.first{
                    self.setViewControllers([firstPageViewController], direction: .forward, animated: false, completion: nil)
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        self.view.backgroundColor = .white
          
          if let id = receitaId{
               print("receita id", id)
        
              PassosRepository().passosByReceitaId(receitaId: id){
               [weak self](pages) in self?.pages = pages
                
               }
            
            self.configurePagination()
              
        }
        
     
     
        let rightButton = UIBarButtonItem(title: "Fechar", style: .plain, target: self, action: #selector(closeRecipePages))
        rightButton.tintColor = .orangeColor
        
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.title = "Titulo"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        if let firstPageViewController = pageViewControllers.first{
            setViewControllers([firstPageViewController], direction: .forward, animated: false, completion: nil)
        }
        
      
     
       
    }
    
    @objc
    func closeRecipePages(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func configurePagination(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        
        let cvPages = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.paginationCV = cvPages
        cvPages.contentInset = UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8)
        cvPages.showsHorizontalScrollIndicator = false
        cvPages.backgroundView = UIView()
        cvPages.backgroundView?.backgroundColor = .white
        cvPages.translatesAutoresizingMaskIntoConstraints = false
        cvPages.register(PageNumberCell.self, forCellWithReuseIdentifier: "cell")
        
        
        cvPages.delegate = self
        cvPages.dataSource = self
        
        self.view.addSubview(cvPages)
        
        cvPages.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        cvPages.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        cvPages.heightAnchor.constraint(equalToConstant: 70).isActive = true
        cvPages.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
        self.paginationCV = cvPages
    }
    
    @objc
    func closePage(){
        self.dismiss(animated: true, completion: nil)
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
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if(completed){
            
            if let currentIndex = pageViewControllers.firstIndex(of: (self.viewControllers?.first)!) {
                if(currentIndex<pageViewControllers.count-1){
                     paginationCV?.scrollToItem(at: IndexPath(item: currentIndex+1, section: 0), at: .right, animated: true)
                }
            }
            
            if let lastIndex = pageViewControllers.firstIndex(of: previousViewControllers[0])  {
                        updateSelection(deselectIndex: lastIndex)
                    }
            }
        
    }
    
    func updateSelection(deselectIndex: Int){
        if let currentIndex = pageViewControllers.firstIndex(of: (self.viewControllers?.first)!) {
            self.currentPage = currentIndex
            paginationCV?.reloadData()
        }
    }
    
    
    
}
