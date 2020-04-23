//
//  SettingsViewController.swift
//  excusemaker
//
//  Created by ptgms on 22.04.20.
//  Copyright © 2020 ptgms. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var furrySwitcher: UISwitch!
    @IBOutlet weak var lowerSwitcher: UISwitch!
    @IBOutlet weak var screamModeSwitch: UISwitch!
    @IBOutlet weak var mockModeSwitch: UISwitch!
    
    var furry = false
    var lower = false
    var scream = false
    var mock = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func furrySwitch(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("furry"), object: nil)
        if (furry==true) {
            furry = false
        } else {
            furry = true
        }
        furrySwitcher.setOn(furry, animated: true)
    }
    
    @IBAction func lowerSwitch(_ sender: Any) {
        if (scream==true) {
            scream = false
            screamModeSwitch.setOn(false, animated: true)
            NotificationCenter.default.post(name: Notification.Name("scream"), object: nil)
        }
        if (mock==true) {
            mock = false
            mockModeSwitch.setOn(false, animated: true)
            NotificationCenter.default.post(name: Notification.Name("mock"), object: nil)
        }
        NotificationCenter.default.post(name: Notification.Name("lower"), object: nil)
        if (lower==true) {
            lower = false
        } else {
            lower = true
        }
        lowerSwitcher.setOn(lower, animated: true)
    }
    
    @IBAction func showGithubPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://github.com/ptgms/ExcuseMaker")!, completionHandler: nil)
    }
    
    @IBAction func screamMode(_ sender: Any) {
        if (lower==true) {
            lower = false
            lowerSwitcher.setOn(false, animated: true)
            NotificationCenter.default.post(name: Notification.Name("lower"), object: nil)
        }
        if (mock==true) {
            mock = false
            mockModeSwitch.setOn(false, animated: true)
            NotificationCenter.default.post(name: Notification.Name("mock"), object: nil)
        }
        NotificationCenter.default.post(name: Notification.Name("scream"), object: nil)
        if (scream==true) {
            scream = false
        } else {
            scream = true
        }
        screamModeSwitch.setOn(scream, animated: true)
    }
    
    @IBAction func mockMode(_ sender: Any) {
        if (lower==true) {
            lower = false
            lowerSwitcher.setOn(false, animated: true)
            NotificationCenter.default.post(name: Notification.Name("lower"), object: nil)
        }
        if (scream==true) {
            scream = false
            screamModeSwitch.setOn(false, animated: true)
            NotificationCenter.default.post(name: Notification.Name("scream"), object: nil)
        }
        NotificationCenter.default.post(name: Notification.Name("mock"), object: nil)
        if (mock==true) {
            mock = false
        } else {
            mock = true
        }
        mockModeSwitch.setOn(mock, animated: true)
    }
}
