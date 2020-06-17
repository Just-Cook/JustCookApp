//
//  SectionReceitaTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 16/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class SectionReceitaTableViewCell: UITableViewCell {

    @IBOutlet weak var tableReceita: UITableView!
    static let xibName = "SectionReceita" // Setando o nome da xib
    static let identifier = "SectionReceitaCell" // Setando o identificador da cell
     
    override func awakeFromNib() {
        super.awakeFromNib()
        configTable()
        
    }
    private func configTable(){
        tableReceita.delegate = self
        tableReceita.dataSource = self
        tableReceita.register((UINib.init(nibName: "receitaModulo", bundle: nil)), forCellReuseIdentifier: "receitaCell")
        
    }
}
extension SectionReceitaTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReceitaModuloTableViewCell.identifier, for: indexPath) as! ReceitaModuloTableViewCell
        return cell
    }
    
}
