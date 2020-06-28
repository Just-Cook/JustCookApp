//
//  NiveisTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

protocol CardMenorTableViewCellDelegate:class {
    func didSelectItem(id:Int, title: String)
}
class CardMenorTableViewCell: UITableViewCell {
    @IBOutlet weak var titulo: UILabel!
    
//    var modulos:[Modulo] = []{
//        didSet{
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//    }
    
    var modulos:[Modulo] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var verTodosButton: UIButton!
    
    weak var delegate:CardMenorTableViewCellDelegate?
    
  
    
    static let identifier = "CardMenorTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       collectionView.delegate = self
       collectionView.dataSource = self
       
           
       collectionView.register(CardMenorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMenorCollectionViewCell.identifier)
        
//        ModuloRepository().listar(){[weak self] (modulos) in self?.modulos = modulos
//        }
    }
    
    func update(){
        self.collectionView.reloadData()
    }


}

extension CardMenorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modulos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMenorCollectionViewCell.identifier, for: indexPath) as? CardMenorCollectionViewCell else{
             fatalError("Wrong identifier")
        }
        cell.configureCard(id: modulos[indexPath.row].id, backgroundImageName: modulos[indexPath.row].imageName, titulo: modulos[indexPath.row].titulo, subtitulo: modulos[indexPath.row].subtitulo, nivel: modulos[indexPath.row].nivel)
        
        let (cellWidth, cellHeigth ) =  self.cellSize()
        
        cell.configuraGradient(size: CGSize(width: cellWidth, height: cellHeigth))
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let (cellWidth, cellHeigth) =  self.cellSize()
        
        return CGSize(width: cellWidth, height: cellHeigth)
      }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentItem = modulos[indexPath.row]
        delegate?.didSelectItem(id: currentItem.id, title: currentItem.titulo)
    }
   
    func cellSize() -> (CGFloat, CGFloat){
        
        let cellWidth =  self.collectionView.frame.width / 2 - 5
        let cellHeigth = self.collectionView.frame.height / 2 - 10
        
        return (cellWidth, cellHeigth)
    }
    
       
}


