//
//  PreparacaoTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class SectionPreparacaoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subtitlePrep: UILabel!
    @IBOutlet weak var collectionPreparacao: UICollectionView!
    static let xibName = "SectionPreparacao" // Setando o nome da xib
    static let identifier = "SectionCell" // Setando o identificador da cell
   
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollection()

    }
    private func configCollection(){
            collectionPreparacao.delegate = self
            collectionPreparacao.dataSource = self
            collectionPreparacao.register(UINib.init(nibName: "Preparacao", bundle: nil), forCellWithReuseIdentifier: "PreparacaoCell")
    }
  
}
extension SectionPreparacaoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionPreparacao.dequeueReusableCell(withReuseIdentifier: PreparacaoCollectionViewCell.identifier, for: indexPath) as! PreparacaoCollectionViewCell
        return cell
    }
    
    
}
