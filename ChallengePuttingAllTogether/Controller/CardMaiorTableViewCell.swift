//
//  RecomendadoTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMaiorTableViewCell: UITableViewCell {
    
    let qItens: Int = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    
       static let identifier = "CardMaiorTableViewCell"
        
        override func awakeFromNib() {
            super.awakeFromNib()
            collectionView.delegate = self
            collectionView.dataSource = self
           
            
            collectionView.showsHorizontalScrollIndicator = false
               
           collectionView.register(CardMaiorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMaiorCollectionViewCell.identifier)
        }

  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension CardMaiorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return qItens
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMaiorCollectionViewCell.identifier, for: indexPath) as? CardMaiorCollectionViewCell else{
             fatalError("Wrong identifier")
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        var cellWidth = self.collectionView.frame.width
        
        if qItens>1{
            cellWidth = cellWidth - 40
        }
            
          return CGSize(width: cellWidth, height: 220)
      }

}


