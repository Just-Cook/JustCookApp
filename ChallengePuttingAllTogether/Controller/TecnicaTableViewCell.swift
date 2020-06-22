//
//  TecnicaTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 19/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class TecnicaTableViewCell: UITableViewCell {
 
    static let identifier = "TecnicaTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func createCell(image_name:String?, titulo:String?, descricao:String?){
             
         let superView: UIView = contentView
      
         var lastView = superView
      

         if let titulo = titulo{
             let tituloView = addTitulo(viewPai: superView, titulo: titulo) as! UILabel
             tituloView.topAnchor.constraint(equalTo: lastView.topAnchor, constant:25).isActive = true
               lastView = tituloView
        }


         if let image_name = image_name{
            let  imagem = addImagem(viewPai: superView, image_name:image_name )
             imagem.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 12).isActive = true
             lastView = imagem
         }

         if let texto = descricao{
             let textoView = addDescricao(viewPai: superView, descricao: texto)
             textoView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 12).isActive = true
             lastView = textoView
         }
         

         superView.bottomAnchor.constraint(equalTo:lastView.bottomAnchor, constant: 12).isActive = true
    
             
     }
    
    private func addTitulo(viewPai:UIView, titulo:String) -> UIView{
        
        let tituloView = UILabel()
        tituloView.text = titulo
        tituloView.textAlignment = NSTextAlignment.left
        tituloView.font = UIFont.boldSystemFont(ofSize: 22)
        
        
        viewPai.addSubview(tituloView)
        
        tituloView.translatesAutoresizingMaskIntoConstraints = false
        
        
        tituloView.leadingAnchor.constraint(equalTo:viewPai.leadingAnchor, constant:16).isActive = true
        
        viewPai.rightAnchor.constraint(equalTo: tituloView.rightAnchor, constant: -16).isActive = true
        

        return tituloView
        
    }
    
    private func addDescricao(viewPai:UIView, descricao:String) -> UIView{
           
        let textView = UITextView()
        
        textView.text = descricao
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = NSTextAlignment.left
            
        textView.font = UIFont.systemFont(ofSize: 14)
            
        viewPai.addSubview(textView)
           
        textView.translatesAutoresizingMaskIntoConstraints = false
           
        textView.leadingAnchor.constraint(equalTo:viewPai.leadingAnchor, constant:16).isActive = true
           
        textView.rightAnchor.constraint(equalTo: viewPai.rightAnchor, constant: -16).isActive = true
           
        return textView
           
    }
       
    
       private func addImagem(viewPai: UIView, image_name:String) -> UIView {
           
           let imageView = UIImageView()
         
            imageView.image = UIImage(named: image_name)
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 10
            imageView.contentMode = UIView.ContentMode.scaleAspectFill
            
            viewPai.addSubview(imageView)
           
           imageView.translatesAutoresizingMaskIntoConstraints = false
        
           imageView.leadingAnchor.constraint(equalTo: viewPai.leadingAnchor, constant: 16).isActive = true
        
           imageView.trailingAnchor.constraint(equalTo: viewPai.trailingAnchor, constant: -16).isActive = true
        
           imageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
           
           return imageView
       }
  
    
    
}

