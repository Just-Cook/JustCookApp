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
    let tamanho = [100, 109, 108]
    var moduleId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        
    }
   private func configTable(){
        ModuloTableView.delegate = self
        ModuloTableView.dataSource = self
//       registro collection de preparação
        ModuloTableView.register(UINib.init(nibName: "SectionPreparacaoCell", bundle: nil), forCellReuseIdentifier: "SectionCell")

        ModuloTableView.register(UINib.init(nibName: "SectionReceita", bundle: nil), forCellReuseIdentifier: "SectionReceitaCell")
        ModuloTableView.register((UINib.init(nibName: "receitaModuloCell", bundle: nil)), forCellReuseIdentifier: "receitaCell")
        
        
//        self.ModuloTableView.register(SectionDescriptionTableViewCell.self, forCellReuseIdentifier: "descripCell")
    }


}
extension ModuloViewController: UITableViewDelegate, UITableViewDataSource{
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 30
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        //        tableView.estimatedRowHeight = 200
//        //        tableView.rowHeight = UITableView.automaticDimension
//        //        return tableView.estimatedRowHeight
//        //    }
//        
//        let height = tamanho[indexPath.row + 1]
//        return CGFloat(height)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel()
        title.frame = CGRect(x: 16, y: 3, width: 375, height: 30)
        view.addSubview(title)
        title.font = sfRounded(size: 22, weight: .bold)
        title.text = nameSections[section]
        
        return view
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
//          cria uma label padrão sem precisar criar no storyboard
            let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
//          seta que a label expanda até o maximo
            cell.textLabel?.numberOfLines = .max
            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            cell.textLabel?.text = "Nesse módulos você aprenderá a fazer alguns bolos classicos da culinária."
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionPreparacaoTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionReceitaCell", for: indexPath) as! SectionReceitaTableViewCell
            return cell

        default:
             return UITableViewCell()
        }
       
    }
}
