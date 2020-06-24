//
//  RecomendadoTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

protocol CardMaiorDelegate:class {
    func didSelectItem(id:Int)
}

class CardMaiorTableViewCell: UITableViewCell {
    
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var modulos : [Modulo] = []{
        didSet{
             DispatchQueue.main.async {
                 self.collectionView.reloadData()
             }
        }
    }
    
    static let identifier = "CardMaiorTableViewCell"
    weak var delegate:CardMaiorDelegate?
        
        override func awakeFromNib() {
            super.awakeFromNib()
            collectionView.delegate = self
            collectionView.dataSource = self
           
            
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
               
           collectionView.register(CardMaiorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMaiorCollectionViewCell.identifier)
            
            
            ModuloRepository().listar(){[weak self] (modulos) in self?.modulos = modulos
                       }
        }

  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension CardMaiorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modulos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMaiorCollectionViewCell.identifier, for: indexPath) as? CardMaiorCollectionViewCell else{
             fatalError("Wrong identifier")
        }
        
         cell.configureCard(backgroundImageName: modulos[indexPath.row].imageName, titulo: modulos[indexPath.row].titulo, subtitulo: modulos[indexPath.row].subtitulo, nivel: modulos[indexPath.row].nivel)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        var cellWidth = self.collectionView.frame.width
        
        if modulos.count>1{
            cellWidth = cellWidth - 40
        }
            
          return CGSize(width: cellWidth, height: 220)
      }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentItem = modulos[indexPath.row]
        
        delegate?.didSelectItem(id: currentItem.id)
        
    }
      
}


