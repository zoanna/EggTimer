//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [ "Soft" : 5, "Medium" : 10, "Hard" : 15]
    
    var secondsRemaining = 60
    
    var timer = Timer()
    
   
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var GrandTitle: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        let progressEgg = Float(Float(self.secondsRemaining))
        
        progressBar.trackTintColor = UIColor.yellow
        
        self.progressBar.setProgress(progressEgg, animated: true)
        
//        progressBar.tintColor = UIColor(red: 0/255.0, green: 122.0, blue: 122.0, alpha: 1)
        
        GrandTitle.text = hardness
        
//        progressBar.progress = 1
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }
        if secondsRemaining == 0 {
            timer.invalidate()
            GrandTitle.text = "Done"
        }
    }
}



