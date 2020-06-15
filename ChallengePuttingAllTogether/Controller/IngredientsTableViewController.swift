//
//  IngredientsTableViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if(indexPath.section == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "ImageDescriptionCell", for: indexPath) as! ImageDescriptionCell
        } else if (indexPath.section == 1){
            cell = tableView.dequeueReusableCell(withIdentifier: "PorcoesCell", for: indexPath) as! PorcaoCell
        }else {
            cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        }
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 280
        } else if (indexPath.section == 1){
            return 60
        }
        return 44
    }

}
