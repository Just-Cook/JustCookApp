//
//  PefilViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 11/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ConquistasViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var nivelLabel: UILabel!
    @IBOutlet weak var nivelLabelNumber: UILabel!
    @IBOutlet weak var barraProgresso: UIProgressView!
    @IBOutlet weak var nextLevelPontLabel: UILabel!
    
    
    let conquistasMock = ConquistasModel.MockConquistas()
    
    let defauls = UserDefaults.standard
    var pontuation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.masksToBounds = true
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.backgroundColor = CGColor(srgbRed: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        
        barraProgresso.layer.masksToBounds = true
        barraProgresso.layer.cornerRadius = 5
        barraProgresso.progressTintColor = UIColor.init(red: 43/255, green: 159/255, blue: 247/255, alpha: 1)
        
        collectionView.layer.masksToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let pontuation = Pontuation()
        nivelLabelNumber.text = String(pontuation.levelPontuation())
        nivelLabel.text = pontuation.nivelString()
        nextLevelPontLabel.text = "/" + String(pontuation.getTotalNextLevel())
        nomeLabel.text = pontuation.levelNivelUserString()
        barraProgresso.progress = Float(pontuation.levelPontuation()) / Float(pontuation.getTotalNextLevel())
       
    }
    
    
}
    
extension ConquistasViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conquistasMock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConquistasCollectionViewCell.identifier, for: indexPath) as! ConquistasCollectionViewCell
       
        cell.image.layer.backgroundColor = CGColor(srgbRed: 196/255, green: 196/255, blue: 196/255, alpha: 1)
     
        cell.configureCell(imageName: conquistasMock[indexPath.row].image, titulo: conquistasMock[indexPath.row].titulo)
 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 140)
    }
    
        
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


