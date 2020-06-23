//
//  IngredientsTableViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 15/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {

    let recipe = Recipe(title: "Arroz Simple", images: "", description: "Muita coisa vai ser escrita aqui", time: "40 min", ingredients: [
        
        Ingredient(name: "Ovo", amount: 4, unity: "qntd"),
        Ingredient(name: "Mortadela", amount: 10, unity: "qntd"),
        Ingredient(name: "Pao", amount: 2, unity: "qntd"),
        Ingredient(name: "Manteiga", amount: 5, unity: "gr"),
        Ingredient(name: "Ketchup", amount: 20, unity: "L"),
        Ingredient(name: "Queijo", amount: 5, unity: "kl"),
        Ingredient(name: "Requeijao", amount: 1, unity: "L"),
        Ingredient(name: "Creme de Cebola", amount: 600, unity: "gr"),
    ], porcoes: 20)
    
    var porcoes: Int?
    var topCellHeight: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.porcoes = recipe.porcoes
        
        let rightButton = UIBarButtonItem(title: "Iniciar", style: .plain, target: self, action: #selector(goToRecipe))
        rightButton.tintColor = .orange
        
        self.navigationItem.rightBarButtonItem = rightButton
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(section==2){
            return recipe.ingredients.count
        }
        
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDescriptionCell", for: indexPath) as! ImageDescriptionCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right: 0)
            cell.RecipeImageView.layer.cornerRadius = 8
            cell.DescriptionRecipe.text = recipe.description
            
            if(self.topCellHeight == nil){
                self.topCellHeight = Float(cell.adjustHeightOfDescription())
            }
            
            return cell
        
        } else if (indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "PorcoesCell", for: indexPath) as! PorcaoCell
            createPorcaoChangeButtons(in: cell)
            cell.PorcaoLabel.text = "Porcoes"
            cell.TimeLabel.text = recipe.time
            return cell
        }
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        
        let ingredient = recipe.ingredients[indexPath.item]
        cell.IngredientNameLabel.text = ingredient.name
        
        let porcaoAmount = Double(self.porcoes!)/Double(recipe.porcoes) * ingredient.amount
        
        cell.IngredientAmountLabel.text = "\(porcaoAmount) \(ingredient.unity)"
            
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
        porcaoText.text = String(self.porcoes!)
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
        self.porcoes = self.porcoes! + 1
        self.tableView!.reloadData()
    }
    
    @objc
    func minusPorcao(){
        if self.porcoes!>0{
            self.porcoes = self.porcoes! - 1
            self.tableView!.reloadData()
        }
    }
    
    @objc
    func goToRecipe(){
        
        let recipePageViewStoryboard = UIStoryboard(name: "RecipeScreen", bundle: nil)
        guard let recipePageViewController = recipePageViewStoryboard.instantiateViewController(identifier: "RecipeScreenStoryboard") as? RecipePageViewController else{
            return
        }
        
        self.navigationController?.pushViewController(recipePageViewController, animated: true)
    }

}
