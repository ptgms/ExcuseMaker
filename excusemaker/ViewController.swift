//
//  ViewController.swift
//  excusemaker
//
//  Created by ptgms on 21.04.20.
//  Copyright © 2020 ptgms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var exc1: UILabel!
    @IBOutlet weak var exc2: UILabel!
    @IBOutlet weak var furrySwitch: UISwitch!
    @IBOutlet weak var lowercaseSwitch: UISwitch!
    var lower = false
    var furry = false
    
    let excuse1 = ["Sorry, I can't come today, since", "Sorry, I can't be there, because", "I think I'm in trouble here, since", "Ah damn, I can't do that because", "I can't come,", "I know I'm kinda late with this, I can't come since", "Ahh crap, I can't come,", "Idk if I can come since", "Fucking hell,"]
    let excuse2 = ["I forgot I have to turn in a paper today", "I gotta bring the dog to the vet", "I have to watch a movie today", "someone from the family needs urgent help right now", "I got an suprise visit here", "I have an project whose deadline is today", "I got an call from my boss", "I have to help at home", "I'm busy working on my project", "someone invited me to the cinema right now"]
    let furryEmotes = [";_;", "._.", "*.*", "owo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func copyClipboardPressed(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = exc1.text! + " " + exc2.text!
    }
    
    @IBAction func generateExcusePressed(_ sender: Any) {
        exc1.text = excuse1[Int.random(in: 0 ..< excuse1.count)]
        exc2.text = excuse2[Int.random(in: 0 ..< excuse2.count)]
        if (furry==true) {
            exc1.text = exc1.text!.replacingOccurrences(of: "l", with: "w")
            exc1.text = exc1.text!.replacingOccurrences(of: "L", with: "W")
            exc1.text = exc1.text!.replacingOccurrences(of: "r", with: "w")
            exc1.text = exc1.text!.replacingOccurrences(of: "R", with: "W")
            //---
            exc2.text = exc2.text!.replacingOccurrences(of: "l", with: "w")
            exc2.text = exc2.text!.replacingOccurrences(of: "L", with: "W")
            exc2.text = exc2.text!.replacingOccurrences(of: "r", with: "w")
            exc2.text = exc2.text!.replacingOccurrences(of: "R", with: "W")
            
            if (Int.random(in: 0 ..< 2) == 0) {
                let torep = exc1.text![exc1.text!.startIndex]
                exc1.text = String(torep) + "-" + exc1.text!
            }
            if (Int.random(in: 0 ..< 2) == 0) {
                exc2.text = exc2.text! + " " + furryEmotes[Int.random(in: 0 ..< furryEmotes.count)]
            }
            
        }
        if (lower==true) {
            exc1.text = exc1.text?.lowercased()
            exc2.text = exc2.text?.lowercased()
        }
    }
    
    @IBAction func lowercasePressed(_ sender: Any) {
        if (lower==true) {
            lower = false
            lowercaseSwitch.setOn(false, animated: true)
        } else if (lower==false) {
            lower = true
            lowercaseSwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func furryPressed(_ sender: Any) {
        if (furry==true) {
            furry = false
            furrySwitch.setOn(false, animated: true)
        } else if (furry==false) {
            furry = true
            furrySwitch.setOn(true, animated: true)
        }
    }
    

}

