//
//  SectionTwoConquistasTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 25/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class SectionTwoConquistasTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
      let conquistasMock = ConquistasModel.MockConquistas()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .red
        collectionView.layer.masksToBounds = true
    }
    
    static let identifier = "ConquistasTableViewCellTwo"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}

extension SectionTwoConquistasTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource{
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return conquistasMock.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConquistasCollectionViewCell.identifier, for: indexPath) as! ConquistasCollectionViewCell
          
           cell.image.layer.backgroundColor = CGColor(srgbRed: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        
           cell.configureCell(imageName: conquistasMock[indexPath.row].image, titulo: conquistasMock[indexPath.row].titulo)
    
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 80, height: 140)
       }
    
    
}
