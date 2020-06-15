//
//  JornadaTableViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class JornadaTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        tableView.register(AlertaTableViewCell.xibForTable(), forCellReuseIdentifier: AlertaTableViewCell.identifier)
        
        tableView.register(NiveisTableViewCell.xibForTable(), forCellReuseIdentifier: NiveisTableViewCell.identifier)
        
    
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertaTableViewCell.identifier, for: indexPath) as? AlertaTableViewCell else{ fatalError("Wrong identifier") }
             return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NiveisTableViewCell.identifier, for: indexPath) as? NiveisTableViewCell else{ fatalError("Wrong identifier") }
            return cell
            
        case 2:
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardMaiorTableViewCell.identifier, for: indexPath) as? CardMaiorTableViewCell else{ fatalError("Wrong identifier") }
        return cell
            
        case 3:
               guard let cell = tableView.dequeueReusableCell(withIdentifier: CardMenorTableViewCell.identifier, for: indexPath) as? CardMenorTableViewCell else{ fatalError("Wrong identifier") }
               return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 65
        }
        if(indexPath.row == 1){
            return 117
        }
       if(indexPath.row == 2){
            return 270
       }
        if(indexPath.row == 3){
            return 650
        }
        return 0
    }
   

}
