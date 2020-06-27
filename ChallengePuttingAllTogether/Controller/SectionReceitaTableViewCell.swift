//
//  SectionReceitaTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 16/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

protocol SectionReceitaTableViewCellDelegate{
    func didSelectReceita(id:Int, title: String)
    
}

class SectionReceitaTableViewCell: UITableViewCell {

    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var tableReceita: UITableView!
    static let xibName = "SectionReceita" // Setando o nome da xib
    static let identifier = "SectionReceitaCell" // Setando o identificador da cell
    var delegate : SectionReceitaTableViewCellDelegate?
    
    
    var receitas : [Receita] = []{
          didSet{
              DispatchQueue.main.async {
                  self.tableReceita.reloadData()
              }
          }
      }
     var moduloId:Int? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configTable()
        
    }
    private func configTable(){
        tableReceita.delegate = self
        tableReceita.dataSource = self
        tableReceita.register((UINib.init(nibName: "receitaModuloCell", bundle: nil)), forCellReuseIdentifier: "receitaCell")
        tableHeight.constant = 4 * 95
        
        
    }
    
    func receitasByModuloId(moduloId: Int){
             ReceitaRepository().receitasModuloId(moduloId: moduloId){[weak self] (receitas) in self?.receitas = receitas}
           
       }
}
extension SectionReceitaTableViewCell: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receitas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReceitaModuloTableViewCell.identifier, for: indexPath) as! ReceitaModuloTableViewCell
        
        cell.configure(backImage: receitas[indexPath.row].imageName, titulo: receitas[indexPath.row].titulo, rendimento: receitas[indexPath.row].rendimento, tempo: receitas[indexPath.row].tempo)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentItem = receitas[indexPath.row]
        delegate?.didSelectReceita(id: currentItem.id, title: currentItem.titulo)
    }
   
    
}
