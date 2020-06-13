//
//  NiveisTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMenorTableViewCell: UITableViewCell {

   
    static let identifier = "CardMenorTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        collectionView.delegate = self
//        collectionView.dataSource = self
        // Initialization code
           
//        collectionView.register(NiveisCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: NiveisCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//extension NiveisTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NiveisCollectionViewCell.identifier, for: indexPath) as? NiveisCollectionViewCell else{
//             fatalError("Wrong identifier")
//        }
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//          return CGSize(width: 117, height: 111)
//      }
//
//}
//
//
