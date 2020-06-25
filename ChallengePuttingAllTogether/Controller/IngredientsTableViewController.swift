//
//  IngredientsTableViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {

    var topCellHeight: Float?
    
    var receitaId: Int? = nil
    
    var receita : Receita = Receita(id: 0, titulo: "none", descricao: "none", imageName: "none", rendimento: 0, tempo: 0)
    {
           didSet{
               DispatchQueue.main.async {
               self.tableView.reloadData()
               }
           }

       }
  
    var ingredientes : [Ingrediente] = []{

        didSet{
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Iniciar", style: .plain, target: self, action: #selector(goToRecipe))


        rightButton.tintColor = UIColor.orangeColor
        

        self.navigationItem.rightBarButtonItem = rightButton
        
        if let id = receitaId{
            print(id)
            ReceitaRepository().receitaId(id: id){[weak self] (receita) in self?.receita = receita
               
            }
            IngredienteRepository().ingredientesByReceitaId(receitaId: id){
                [weak self](ingredientes) in self?.ingredientes = ingredientes
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(section==2){
            return ingredientes.count
          
        }
        
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDescriptionCell", for: indexPath) as! ImageDescriptionCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right: 0)
            cell.RecipeImageView.layer.cornerRadius = 8
            cell.configure(imageName: receita.imageName, descricao: receita.descricao)
            
            self.topCellHeight = Float(cell.adjustHeightOfDescription())
            
            return cell
        
        } else if (indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "PorcoesCell", for: indexPath) as! PorcaoCell
            createPorcaoChangeButtons(in: cell)
            cell.configure(tempo: receita.tempo)
        
            return cell
        }
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
     
         let ingrediente = ingredientes[indexPath.item]
           cell.configure(nome: ingrediente.nome, quantidade: ingrediente.quantidade, unidade: ingrediente.unidade)
            
        return cell
       
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            
            if let cellHeight = self.topCellHeight {
                return CGFloat(cellHeight)
            }
            return 280
            
        } else if (indexPath.section == 1){
            return 60
        }
        return 44
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section == 2){
            return "Ingredientes"
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnView = UITableViewHeaderFooterView()
        returnView.backgroundView = UIView()
        return returnView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 44
        }
        return 0
    }
    
    
    func createPorcaoChangeButtons(in cell: PorcaoCell){
        
        let orangeView = UIView()
        orangeView.frame = CGRect()
        orangeView.backgroundColor = .orangeColor
        orangeView.layer.cornerRadius = 8
        
        let whiteView = UIView()
        whiteView.backgroundColor = .white

        let porcaoText = UILabel()
        porcaoText.text = String(receita.rendimento)
        porcaoText.textAlignment = .center


        whiteView.addSubview(porcaoText)
        porcaoText.translatesAutoresizingMaskIntoConstraints = false
        porcaoText.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 6).isActive = true
        porcaoText.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -6).isActive = true
        porcaoText.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor, constant: 0).isActive = true

        orangeView.addSubview(whiteView)
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor, constant: 40).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: orangeView.trailingAnchor, constant: -40).isActive = true
        whiteView.centerYAnchor.constraint(equalTo: orangeView.centerYAnchor, constant: 0).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        
        cell.addSubview(orangeView)
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        orangeView.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
        orangeView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        orangeView.widthAnchor.constraint(equalToConstant: 144).isActive = true
        
        let addButton = UIButton()
        addButton.setTitle("+", for: .normal)
        addButton.tintColor = .white
        addButton.addTarget(self, action: #selector(plusPorcao), for: .touchUpInside)
        
        orangeView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.trailingAnchor.constraint(equalTo: orangeView.trailingAnchor, constant: 0).isActive = true
        addButton.centerYAnchor.constraint(equalTo: orangeView.centerYAnchor, constant: 0).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let minusButton = UIButton()
        minusButton.setTitle("-", for: .normal)
        minusButton.tintColor = .white
        minusButton.addTarget(self, action: #selector(minusPorcao), for: .touchUpInside)
        
        orangeView.addSubview(minusButton)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor, constant: 0).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: orangeView.centerYAnchor, constant: 0).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    @objc
    func plusPorcao(){
        receita.rendimento = receita.rendimento + 1
        self.tableView!.reloadData()
    }
    
    @objc
    func minusPorcao(){
        if receita.rendimento > 0{
            receita.rendimento  = receita.rendimento  - 1
            self.tableView!.reloadData()
        }
    }
    
    @objc
    func goToRecipe(){
        
        let recipePageViewStoryboard = UIStoryboard(name: "RecipeScreen", bundle: nil)
        guard let recipePageViewController = recipePageViewStoryboard.instantiateViewController(identifier: "RecipeScreenStoryboard") as? RecipePageViewController else{
            return
        }
        recipePageViewController.receitaId = receitaId
        recipePageViewController.hidesBottomBarWhenPushed  = true
        self.navigationController?.pushViewController(recipePageViewController, animated: true)
    }

}
