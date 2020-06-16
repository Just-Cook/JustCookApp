//
//  ModuloViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ModuloViewController: UIViewController {

    @IBOutlet weak var ModuloTableView: UITableView!
    let nameSections = ["", "Preparação", "Receita"]
    let tamanho = [107, 109, 108]
    let sect = [SectionPreparacaoTableViewCell(), SectionPreparacaoTableViewCell(), SectionPreparacaoTableViewCell()]

    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        
        
    }
   private func configTable(){
        ModuloTableView.delegate = self
        ModuloTableView.dataSource = self
        ModuloTableView.register(UINib.init(nibName: "SectionPreparacao", bundle: nil), forCellReuseIdentifier: "SectionCell")
    }


}
extension ModuloViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tamanho[indexPath.row]
        return CGFloat(height)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
       }
       
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel()
        title.frame = CGRect(x: 16, y: 3, width: 375, height: 50)
        view.addSubview(title)
        title.text = nameSections[section]
        return view
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionPreparacaoTableViewCell
            return cell
        case 2:
             return UITableViewCell()

        default:
             return UITableViewCell()
        }
       
    }
}
