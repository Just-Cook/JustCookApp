//
//  RecipePageExtension.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 11/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

extension RecipePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageNumberCell
        cell.frame.size = CGSize(width: 60, height: 32)
        cell.changeNum(to: indexPath.item+1)
        cell.backgroundView = UIView()
        
        if (indexPath.item == self.currentPage) {
            cell.selectCell()
        }else{
            cell.deselectCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.currentPage != indexPath.item {
            
            if self.currentPage > indexPath.item {
                self.setViewControllers([pageViewControllers[indexPath.item]], direction: .reverse, animated: true, completion: nil)
                updateSelection(deselectIndex: self.currentPage)
            }else{
                self.setViewControllers([pageViewControllers[indexPath.item]], direction: .forward, animated: true, completion: nil)
                updateSelection(deselectIndex: self.currentPage)
            }
            self.currentPage = indexPath.item
        }
        
        
    }
    
}

class PageNumberCell: UICollectionViewCell {
    
    var numberText : UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        numberText.textAlignment = .center
        numberText.baselineAdjustment = .alignCenters
        
        numberText.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(numberText)
        
        numberText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        numberText.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0).isActive = true
        numberText.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        numberText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func changeNum(to num:Int){
        numberText.text = String(num)
    }
    
    func selectCell(){
        self.backgroundView?.backgroundColor = .orangeColor
        self.numberText.textColor = .white
    }
    
    func deselectCell() {
        self.backgroundView?.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        self.numberText.textColor = .black
    }
    
}
