//
//  VerTodosCollectionViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class VerTodosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

       collectionView.register(CardMenorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMenorCollectionViewCell.identifier)
        }
        

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 7
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMenorCollectionViewCell.identifier, for: indexPath) as? CardMenorCollectionViewCell else{
                    fatalError("Wrong identifier")
               }

        return cell
    
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 160, height: 278)
     }


}
