//
//  ConquistasTableViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 25/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ConquistasTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionOneConquistasTableViewCell.identifier) as! SectionOneConquistasTableViewCell
            cell.configure()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionTwoConquistasTableViewCell.identifier) as! SectionTwoConquistasTableViewCell
          
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    


}
