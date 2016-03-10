//
//  ViewController.swift
//  Multiples
//
//  Created by Matei Suica on 10/03/16.
//  Copyright © 2016 QuadroQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var multiplyByFIeld: UITextField!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var resultText: UILabel!
    
    var multiplyBy = 0
    var runningSum = 0
    let maxSum = 1000
    
    
    @IBAction func addButtonAction(sender: UIButton) {
     
        resultText.text = "\(runningSum) + \(multiplyBy) = \(runningSum + multiplyBy)"
           runningSum += multiplyBy
        if runningSum >= maxSum {
            hideThings(false)
        }
    }

    @IBAction func playButtonAction(sender: UIButton) {
        runningSum = 0
        if multiplyByFIeld.text != nil && multiplyByFIeld.text != "" {
                    resultText.text = "0"
            multiplyBy = Int(multiplyByFIeld.text!)!
            hideThings(true)
        }
        
    }

    func hideThings(hide: Bool) {
        playButton.hidden = hide
        multiplyByFIeld.hidden = hide
        logoImage.hidden = hide
        
        addButton.hidden = !hide
        resultText.hidden = !hide
        visualEffectView.hidden = !hide
    }
}

