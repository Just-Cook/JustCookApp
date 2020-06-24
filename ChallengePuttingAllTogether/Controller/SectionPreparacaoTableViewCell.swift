//
//  PreparacaoTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

protocol SectionPreparacaoTableViewCellDelegate:class {
    func didSelectItem(id:Int)
}

class SectionPreparacaoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subtitlePrep: UILabel!
    @IBOutlet weak var collectionPreparacao: UICollectionView!
    static let xibName = "SectionPreparacaoCell" // Setando o nome da xib
    static let identifier = "SectionCell" // Setando o identificador da cell
   
    var tecnicas : [Tecnica] = []{
        didSet{
            DispatchQueue.main.async {
                self.collectionPreparacao.reloadData()
            }
        }
    }
    
    weak var delegate: SectionPreparacaoTableViewCellDelegate?
   
   
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollection()
        subtitlePrep.font = .systemFont(ofSize: 15, weight: .regular)
//        subtitlePrep.lineBreakMode = .byWordWrapping
//        subtitlePrep.numberOfLines = .max
        
        TecnicaRepository().listar{[weak self] (tecnicas) in self?.tecnicas = tecnicas
        }

    }
    private func configCollection(){
            collectionPreparacao.delegate = self
            collectionPreparacao.dataSource = self
            collectionPreparacao.register(UINib.init(nibName: "Preparacao", bundle: nil), forCellWithReuseIdentifier: "PreparacaoCell")
    }
    
  
  
}
extension SectionPreparacaoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tecnicas.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionPreparacao.dequeueReusableCell(withReuseIdentifier: PreparacaoCollectionViewCell.identifier, for: indexPath) as! PreparacaoCollectionViewCell
        
        
        cell.configure(image: tecnicas[indexPath.row].imageName, titulo: tecnicas[indexPath.row].titulo)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentItem = tecnicas[indexPath.row]
        
        delegate?.didSelectItem(id: currentItem.id)
      
        
        
    }
    
}
