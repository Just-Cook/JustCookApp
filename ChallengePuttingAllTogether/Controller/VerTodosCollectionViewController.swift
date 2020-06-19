//
//  VerTodosCollectionViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class VerTodosCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
       collectionView.register(CardMenorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMenorCollectionViewCell.identifier)
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMenorCollectionViewCell.identifier, for: indexPath) as? CardMenorCollectionViewCell else{
                    fatalError("Wrong identifier")
               }

        return cell


    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let cellWidth =  self.collectionView.frame.width / 2 - 5
        let cellHeigth = self.view.safeAreaLayoutGuide.layoutFrame.height / 3 + 50

         return CGSize(width: cellWidth, height: cellHeigth)
     }


}
