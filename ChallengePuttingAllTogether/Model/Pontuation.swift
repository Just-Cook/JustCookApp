//
//  Pontuation.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 17/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class Pontuation {
    
    let defauls = UserDefaults.standard
    static var nav: UINavigationController?
    
    func getTotalPoints()->Int{
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        return totalPontuation
    }
    
    
    
    func getTotalNextLevel() -> Int{
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return 100
        case 100..<200:
            return 100
        default:
            return 200
        }
        
    }
    
    func levelPontuation() -> Int {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return totalPontuation
        case 100..<200:
            return totalPontuation - 100
        default:
            return totalPontuation - 200
        }
    }
    
    func levelPontuation(points: Int) -> Int {
        
        let totalPontuation = points
        
        switch totalPontuation {
        case 0..<100:
            return totalPontuation
        case 100..<200:
            return totalPontuation - 100
        default:
            return totalPontuation - 200
        }
    }
    
    func nivelString() -> String {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return "Nivel 1"
        case 100..<200:
            return "Nivel 2"
        default:
            return "Nivel 3"
        }
        
    }
    
    func levelNivelUserString() -> String {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return "Profissional do Miojo"
        case 100..<200:
            return "Orgulho da Mamae"
        default:
            return "Eu sou a Lenda"
        }
    }
    
    func userLevelNumber() -> Int {
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return 1
        case 100..<200:
            return 2
        default:
            return 3
        }
    }
    
    func userLevelNumber(points: Int) -> Int {
        let totalPontuation = points
        
        switch totalPontuation {
        case 0..<100:
            return 1
        case 100..<200:
            return 2
        default:
            return 3
        }
    }
    
    func increasePontuation(in num: Int) -> Int{
        
        var currentPontuation = defauls.integer(forKey: "totalPontuation")
        currentPontuation = currentPontuation + num
       
        defauls.set(currentPontuation, forKey: "totalPontuation")
    
        return currentPontuation
    }

    func decreasePontuation(in num: Int){
        
        var currentPontuation = defauls.integer(forKey: "totalPontuation")
        currentPontuation = currentPontuation - num
       
        defauls.set(currentPontuation, forKey: "totalPontuation")
    }
    
    func zeraPontuation(){
        defauls.set(0, forKey: "totalPontuation")
    }
    
    func completConquer(id:Int){
        if let currentConquers = defauls.array(forKey: "conquersId") as? [Int]{
            var totalIds = currentConquers
            totalIds.append(id)
            defauls.set(totalIds, forKey: "conquersId")
        }
    }
    
    func setInicialDefaults(){
        
        if let _ = defauls.array(forKey: "conquersId") as? [Int] {
            
        }else{
            defauls.set([], forKey: "conquersId")
        }
        
        if let _ = defauls.array(forKey: "completeRecipesId") as? [Int]{
            
        }else{
            defauls.set([], forKey: "completeRecipesId")
        }
        
        if let _ = defauls.array(forKey: "completeModulesId") as? [Int]{
            
        }else{
            defauls.set([], forKey: "completeModulesId")
        }
    }
    
    func verifyConquerId(id: Int) -> Bool{
        if let currentConquers = defauls.array(forKey: "conquersId") as? [Int]{
            return currentConquers.contains(id)
            
        }
        
        return false
    }
    
    
    func saveCompletedRecipe(id: Int){
        if let currentConquers = defauls.array(forKey: "completeRecipesId") as? [Int]{
            var totalIds = currentConquers
            totalIds.append(id)
            defauls.set(totalIds, forKey: "completeRecipesId")
        }
    }
    
    
    func seIfRecipeIsComplete(id:Int)->Bool{
        if let currentConquers = defauls.array(forKey: "completeRecipesId") as? [Int]{
        
            return currentConquers.contains(id)
        
        }
        return false
    }
    
    
    func setConquers(recipeId: Int){
        
        let recipeModule = recipeModuleId(recipeId: recipeId)
        
        if let currentRecipesId = defauls.array(forKey: "completeRecipesId") as? [Int]{
            //Primeira Receita
            if(currentRecipesId.count == 1){
                completConquer(id:1)
            }
            
            let isModuleCompleted = seeIfModuleIsCompleted(moduleId: recipeModule)
            
            if isModuleCompleted {
                
                switch recipeModule {
                case 1:
                    completConquer(id: 2)
                case 11:
                    completConquer(id: 5)
                case 21:
                    completConquer(id: 3)
                case 31:
                    completConquer(id: 4)
                default:
                    break
                }
                
            }
            
        }
        
    }
    
    func setCompletedModule(moduleId: Int){
        if let completeModules = defauls.array(forKey: "completeModulesId") as? [Int]{
            var totalIds = completeModules
            totalIds.append(moduleId)
            defauls.set(totalIds, forKey: "completeModulesId")
        }
    }
    
    
    func recipeModuleId(recipeId: Int) -> Int{
        
        switch recipeId {
        case 1, 11, 21:
            return 31
        case 31, 41:
            return 1
        case 51, 61:
            return 11
        case 71, 81, 91, 101:
            return 21
        default:
            return 0
        }
    }
    
    func seeIfModuleIsCompleted(moduleId: Int) -> Bool {
        
        if let currentRecipes = defauls.array(forKey: "completeRecipesId") as? [Int]{
            
            switch moduleId {
            case 1:
                return (currentRecipes.contains(31) && currentRecipes.contains(41))
            
            case 11:
                return (currentRecipes.contains(51) && currentRecipes.contains(61))
            
            case 21:
                return (currentRecipes.contains(71) && currentRecipes.contains(81) && currentRecipes.contains(91) && currentRecipes.contains(101))
            
            case 31:
                return (currentRecipes.contains(1) && currentRecipes.contains(11) && currentRecipes.contains(21))
                
            default:
                return false
            }
            
        }
        
        return false
        
    }
    
    func finalizeRecipe(recipeId:Int){
        
        saveCompletedRecipe(id: recipeId)
        
        let recipeModule = recipeModuleId(recipeId: recipeId)
        let isModuleCompleted = seeIfModuleIsCompleted(moduleId: recipeModule)
        
        if isModuleCompleted{
            setCompletedModule(moduleId: recipeModule)
        }
        
        setConquers(recipeId: recipeId)
        
    }
    
    
    
}
