//
//  SectionTwoConquistasTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 25/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class SectionTwoConquistasTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
      let conquistasMock = ConquistasModel.MockConquistas()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    
        collectionView.layer.masksToBounds = true
        
        collectionView.layer.masksToBounds = true
        collectionView.allowsSelection = false
        collectionView.isScrollEnabled = false
        
        titulo.text = "Selos"
       
    }
    
    static let identifier = "ConquistasTableViewCellTwo"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCollection(){
        collectionView.reloadData()
    }


}

extension SectionTwoConquistasTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

           return conquistasMock.count
       
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConquistasCollectionViewCell.identifier, for: indexPath) as! ConquistasCollectionViewCell
        
           cell.image.layer.backgroundColor = CGColor(srgbRed: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        
        cell.configureCell(id:conquistasMock[indexPath.row].id, imageName: conquistasMock[indexPath.row].image, titulo: conquistasMock[indexPath.row].titulo)
        
     
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 90, height: 140)
       }
    
    
}
