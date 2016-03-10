//
//  ViewController.swift
//  Tapper
//
//  Created by Matei Suica on 10/03/16.
//  Copyright © 2016 QuadroQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var maxTaps = 0
    var currentTap = 0
    
    
    @IBOutlet weak var logoImage : UIImageView!
    @IBOutlet weak var howManyTapsText : UITextField!
    @IBOutlet weak var playButton : UIButton!
    
    @IBOutlet weak var tapsLabel : UILabel!
    @IBOutlet weak var tabButton : UIButton!


    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        
        if howManyTapsText.text != nil && howManyTapsText.text != "" {
            hideOrShowStuff(true)
            
            maxTaps =  Int(howManyTapsText.text!)!
            
            currentTap = 0
           updateTapsLabel()
            
        }
    }

    @IBAction func onTapButtonPressed(sender: UIButton!) {
        currentTap++
        updateTapsLabel()
        if isGameOver() {
            restartGame()
        }
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTap) taps"
    }
    
    func isGameOver() -> Bool {
        if currentTap >= maxTaps {
            return true
        }
        return false;
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsText.text = ""
        hideOrShowStuff(false)
    }
    
    func hideOrShowStuff(hide: Bool) {
        logoImage.hidden = hide
        howManyTapsText.hidden = hide
        playButton.hidden = hide
        
        tapsLabel.hidden = !hide
        tabButton.hidden = !hide
    }
}

