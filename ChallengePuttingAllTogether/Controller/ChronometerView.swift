//
//  ChronometerView.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 12/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ChronometerView: UIView {

    @IBOutlet weak var ChronoImage: UIImageView!
    @IBOutlet weak var ChronoLabel: UILabel!
    
    var isStarted = false
    
    var seconds: Int?
    var timer:Timer?
    
    public func ready(seconds: Int){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toogleTimer))
        ChronoImage.isUserInteractionEnabled = true
        ChronoImage.addGestureRecognizer(tap)
        ChronoImage.image = #imageLiteral(resourceName: "play")
        
        self.seconds = seconds
        
        editTimeLabel()
    }
    
    @objc
    func toogleTimer(){
        if(self.isStarted){
            self.timer!.invalidate()
            self.isStarted = false
            ChronoImage.image = #imageLiteral(resourceName: "play")
        }else{
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreaseTimer), userInfo: nil, repeats: true)
            self.isStarted = true
            ChronoImage.image = #imageLiteral(resourceName: "pause")
        }
            
    }
    
    public func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreaseTimer), userInfo: nil, repeats: true)
    }
    
    
    
    @objc
    func decreaseTimer(){
        self.seconds! = seconds! - 1
        
        if(seconds!>=0){
            editTimeLabel()
        }else{
            timer!.invalidate()
        }
     }
    
    func editTimeLabel(){
        var restSeconds = seconds!
               
        let hours:Int = Int(restSeconds / 3600)
        restSeconds = restSeconds - hours * 3600
        var hoursString = String(hours)
        if hours<10{
            hoursString = "0"+hoursString
        }
        
        let minutes:Int = Int(restSeconds/60)
        var minutesString = String(minutes)
        if minutes<10{
            minutesString = "0"+minutesString
        }
        
        restSeconds = restSeconds - minutes * 60
        var secondsString = String(restSeconds)
        if restSeconds < 10 {
            secondsString = "0"+secondsString
        }
        
        ChronoLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
    }

}
