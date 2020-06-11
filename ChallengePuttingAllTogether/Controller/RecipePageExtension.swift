//
//  RecipePageExtension.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 11/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

extension RecipePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.frame.size = CGSize(width: 60, height: 32)
        
        let numberText = UILabel()
        numberText.text = String(indexPath.item+1)
        numberText.textAlignment = .center
        numberText.baselineAdjustment = .alignCenters
        
        numberText.translatesAutoresizingMaskIntoConstraints = false
        
        cell.addSubview(numberText)
        
        numberText.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0).isActive = true
        numberText.trailingAnchor.constraint(equalTo:cell.trailingAnchor, constant: 0).isActive = true
        numberText.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        numberText.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        
        cell.backgroundView = UIView()
        
        if (indexPath.item == 0) {
            numberText.textColor = .white
            cell.backgroundView?.backgroundColor = UIColor(red: 248/255, green: 162/255, blue: 52/255, alpha: 1)
        }else{
            cell.backgroundView?.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        }
        
        return cell
    }
    
}

