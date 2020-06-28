//
//  VerTodosCollectionViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class VerTodosCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var modulos: [Modulo] = []{
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
       collectionView.register(CardMenorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMenorCollectionViewCell.identifier)
        
        ModuloRepository().listar(){
            [weak self] (modulos) in self?.modulos = modulos
        }
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return modulos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMenorCollectionViewCell.identifier, for: indexPath) as? CardMenorCollectionViewCell else{
                    fatalError("Wrong identifier")
               }
        cell.configureCard(id: modulos[indexPath.row].id, backgroundImageName: modulos[indexPath.row].imageName, titulo: modulos[indexPath.row].titulo, subtitulo: modulos[indexPath.row].subtitulo, nivel: modulos[indexPath.row].nivel)
     
        let (cellWidth, cellHeigth) = cellSize()
        
        cell.configuraGradient(size: CGSize(width: cellWidth, height: cellHeigth))
        
        return cell


    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
        let (cellWidth, cellHeigth) = cellSize()
        return CGSize(width: cellWidth, height: cellHeigth)
     
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentItem = modulos[indexPath.row]
        
        let telaModulo = UIStoryboard(name: "Modulo", bundle: nil).instantiateViewController(withIdentifier: "moduloView") as? ModuloViewController
        telaModulo?.moduloId = currentItem.id
           
        self.navigationController?.pushViewController(telaModulo!, animated: true)
    }
    
    func cellSize() -> (CGFloat, CGFloat){
        
        let cellWidth =  self.collectionView.frame.width / 2 - 5
        let cellHeigth = self.collectionView.frame.height / 2 - 10
        
        return (cellWidth, cellHeigth)
    }

}
