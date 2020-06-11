//
//  PagesCollectionViewController.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PagesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let itensNumber:Int = 2
    
    
    init(){
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 40, height: 60)
        //layout.
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        //self.collectionViewLayout = layout
        self.collectionView.backgroundView = UIView()
        self.collectionView.backgroundView?.backgroundColor = .red
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
 
        return 4
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        cell.backgroundView?.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 60)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

class CustomCell: UICollectionViewCell {
    
   
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        

        backgroundColor = .red
        
//        contentView.addSubview(bg)
//
//        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
//        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
