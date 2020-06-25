//
//  TecnicaTableViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 19/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class TecnicaTableViewController: UITableViewController {

    
    var items : [Item] = []{
          didSet{
              DispatchQueue.main.async {
                  self.tableView.reloadData()
              }
          }
      }
    
    var tecnicaId:Int? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
     
        ItemRepository().listar(tecnicaId: tecnicaId!){[weak self] (items) in self?.items = items
            }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TecnicaTableViewCell()
        
   
       
        cell.createCell(image_name: items[indexPath.row].imageName, titulo: items[indexPath.row].titulo, descricao: items[indexPath.row].descricao)
      
        
        return cell
    }


}
