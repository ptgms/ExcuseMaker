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
    
    
    var lower = false
    var furry = false
    var scream = false
    let excuse1 = ["Sorry, I can't come today, since", "Sorry, I can't be there, because", "I think I'm in trouble here, since", "Ah damn, I can't do that because", "I can't come,", "I know I'm kinda late with this, I can't come since", "Ahh crap, I can't come,", "Idk if I can come since", "Fucking hell,"]
    let excuse2 = ["I forgot I have to turn in a paper today", "I gotta bring the dog to the vet", "I have to watch a movie today", "someone from the family needs urgent help right now", "I got an suprise visit here", "I have an project whose deadline is today", "I got an call from my boss", "I have to help at home", "I'm busy working on my project", "someone invited me to the cinema right now"]
    let excuse1_de = ["Sorry, ich kann nicht kommen, denn", "Sorry, ich kann nicht erscheinen, denn", "Ich glaube ich hab hier ein Problem, denn", "Ah verdammt, ich kann das nicht machen, denn", "Ich kann nicht kommen,", "Ich weiß ich bin spät damit, aber ich kann nicht kommen, denn", "Ahh verdammt, ich kann nicht kommen,", "Weiß nich ob ich kommen kann,", "Verdammt nochmal,"]
    let excuse2_de = ["ich hab vergessen ich muss eine Arbeit heute abgeben", "ich muss meinen Hund zum Tierarzt bringen", "ich muss heute einen Film angucken", "jemand von meiner Familie braucht drigends Hilfe", "ich hab einen Überraschungsbesuch hier", "ich hab ein Projekt was ich heute einreichen muss", "ich werde von meinem Chef angerufen", "ich muss zuhause helfen", "ich arbeite an meinem Projekt", "jemand hat mich gerade zum Kino eingeladen"]
    let furryEmotes = [";_;", "._.", "*.*", "owo", "uwu"]
    
    let langStr = Locale.current.languageCode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(furryOnOff), name: Notification.Name("furry"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(lowerOnOff), name: Notification.Name("lower"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(screamOnOff), name: Notification.Name("scream"), object: nil)
    }
    
    @objc func furryOnOff() {
        if (furry==true) {
            furry = false
        } else {
            furry = true
        }
        
    }
    
    @objc func lowerOnOff() {
        if (lower==true) {
            lower = false
        } else {
            lower = true
        }
    }
    
    @objc func screamOnOff() {
        if (scream==true) {
            scream = false
        } else {
            scream = true
        }
    }
    
    @IBAction func copyClipboardPressed(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = exc1.text! + " " + exc2.text!
    }
    
    
    @IBAction func generateExcusePressed(_ sender: Any) {
        if (langStr=="de") {
            exc1.text = excuse1_de[Int.random(in: 0 ..< excuse1_de.count)]
            exc2.text = excuse2_de[Int.random(in: 0 ..< excuse2_de.count)]
        } else {
            exc1.text = excuse1[Int.random(in: 0 ..< excuse1.count)]
            exc2.text = excuse2[Int.random(in: 0 ..< excuse2.count)]
        }
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
        if (scream==true) {
            exc1.text = exc1.text?.uppercased()
            exc2.text = exc2.text?.uppercased()
        }
    }
    
    

}

