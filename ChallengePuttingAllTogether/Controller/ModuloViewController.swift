//
//  ModuloViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Cecilia Soares on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ModuloViewController: UIViewController{
    
    
    @IBOutlet weak var ModuloTableView: UITableView!
    let nameSections = ["", "Preparação", "Receita"]
    var moduloId :Int? = nil
    
    
    var modulo : Modulo?{
        didSet{
            DispatchQueue.main.async {
                self.ModuloTableView.reloadData()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        
        ModuloRepository().moduloId(moduloId: moduloId!){[weak self] (modulo) in self?.modulo = modulo
            //            self?.title = modulo.titulo
            
        }
        setupNavigationMultilineTitle()
        self.navigationItem.largeTitleDisplayMode = .always
        //        for navItem in (self.navigationController?.navigationBar.subviews)! {
        //                for itemSubView in navItem.subviews {
        //                    if let largeLabel = itemSubView as? UILabel {
        //                        largeLabel.text = self.title
        //                        largeLabel.numberOfLines = 0
        //                        largeLabel.lineBreakMode = .byTruncatingTail
        //                    }
        //                }
        //            }
    }
    func setTitle (titulo: String){
        self.title = titulo
        //            setupNavigationMultilineTitle()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.ModuloTableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationMultilineTitle()
    }
    
    //    func titleMod(moduloT: String){
    //        self.title = moduloT
    //    }
    private func configTable(){
        ModuloTableView.delegate = self
        ModuloTableView.dataSource = self
        //       registro collection de preparação
        ModuloTableView.register(UINib.init(nibName: "SectionPreparacaoCell", bundle: nil), forCellReuseIdentifier: "SectionCell")
        
        ModuloTableView.register(UINib.init(nibName: "SectionReceita", bundle: nil), forCellReuseIdentifier: "SectionReceitaCell")
        
        
    }
    
    
}
extension ModuloViewController {
    
    func setupNavigationMultilineTitle() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        for sview in navigationBar.subviews {
            for ssview in sview.subviews {
                guard let label = ssview as? UILabel else { break }
                if label.text == self.title {
 //                   label.numberOfLines = 0
//                    label.lineBreakMode = .byWordWrapping
//                    label.sizeToFit()
                    UIView.animate(withDuration: 0.3, animations: {
                        navigationBar.frame.size.height = 57 + label.frame.height
                    })
                }
            }
        }
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
            cell.textLabel?.text = modulo?.descricao
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionPreparacaoTableViewCell
            
            cell.tecnicasByModuloId(moduloId: moduloId!)
            cell.delegate = self
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionReceitaCell", for: indexPath) as! SectionReceitaTableViewCell
            cell.receitasByModuloId(moduloId: moduloId!)
            cell.delegate = self
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
    
}
extension ModuloViewController : SectionReceitaTableViewCellDelegate {
    func didSelectReceita(id: Int, title: String) {
        
        let telaIngredient = UIStoryboard(name: "IngredientsRecipeScreen", bundle: nil).instantiateViewController(withIdentifier: "ingredientRecipe") as? IngredientsTableViewController
        
        telaIngredient?.receitaId = id
        telaIngredient?.configureTitle(title: title)
        
        self.navigationController?.pushViewController(telaIngredient!, animated: true)
    }
    
    
}

extension ModuloViewController : SectionPreparacaoTableViewCellDelegate {
    func didSelectItem(id: Int) {
        self.performSegue(withIdentifier: "segueTecnica", sender: id)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destiny = segue.destination as? TecnicaTableViewController
        destiny?.tecnicaId = (sender as! Int)
        
    }
}
