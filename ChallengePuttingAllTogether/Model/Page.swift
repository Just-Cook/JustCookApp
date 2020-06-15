//
//  Page.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 10/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

public class Page{
    
    let id:Int
    let links, smallImage, bigImage, video: String?
    let chronometer:Int?
    let text: String

    init(text: String, chronometer:Int?, links:String?, smallImage:String?, bigImage:String?, video:String? ) {
        self.id = 1
        self.text = text
        self.links = links
        self.chronometer = chronometer
        self.smallImage = smallImage
        self.bigImage = bigImage
        self.video = video
    }
    
}
