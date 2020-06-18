//
//  NiveisTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMenorTableViewCell: UITableViewCell {
    @IBOutlet weak var titulo: UILabel!
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var verTodosButton: UIButton!
    

    static let identifier = "CardMenorTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       collectionView.delegate = self
       collectionView.dataSource = self
       
           
       collectionView.register(CardMenorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMenorCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CardMenorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMenorCollectionViewCell.identifier, for: indexPath) as? CardMenorCollectionViewCell else{
             fatalError("Wrong identifier")
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth =  self.collectionView.frame.width / 2 - 5
        let cellHeigth = self.collectionView.frame.height / 2 - 10
        
          return CGSize(width: cellWidth, height: cellHeigth)
      }

}


