//
//  SettingsTableViewController.swift
//  excusemaker
//
//  Created by ptgms on 14.05.20.
//  Copyright © 2020 ptgms. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var lowercaseSwitch: UITableViewCell!
    @IBOutlet weak var screamingModeSwitch: UITableViewCell!
    @IBOutlet weak var mockeryModeSwitch: UITableViewCell!
    @IBOutlet weak var furryCell: UITableViewCell!
    @IBOutlet weak var furrySwitch: UISwitch!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var buildLabel: UILabel!
    @IBOutlet weak var darkBlockChain: UITableViewCell!
    @IBOutlet weak var darkBlockChainSwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        furryCell.accessoryView = furrySwitch
        darkBlockChain.accessoryView = darkBlockChainSwitch
        let version: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as! String
        let build: String = Bundle.main.infoDictionary!["CFBundleVersion"]! as! String
        versionLabel.text = "version".localized + version
        buildLabel.text = "build".localized + build
        
        let defaults = UserDefaults.standard
        
        if (defaults.bool(forKey: "mock") == true) {
            mockeryModeSwitch.accessoryType = .checkmark
        } else if (defaults.bool(forKey: "lower") == true) {
            lowercaseSwitch.accessoryType = .checkmark
        } else if (defaults.bool(forKey: "scream") == true) {
            screamingModeSwitch.accessoryType = .checkmark
        }
        furrySwitch.setOn(GlobalVar.furry, animated: true)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            switch indexPath.row {
            case 1:
                guard let url = URL(string: "https://github.com/ptgms/ExcuseMaker") else { return }
                UIApplication.shared.open(url)
            case 2:
                return
            default:
                exit(-1)
            }
        } else if (indexPath.section == 1) {
            switch indexPath.row {
            case 0:
                furrySwitchFunc()
            case 1:
                if (GlobalVar.scream==true) {
                    GlobalVar.scream = false
                    defaults.set(false, forKey: "scream")
                    screamingModeSwitch.accessoryType = .none
                }
                if (GlobalVar.mock==true) {
                    GlobalVar.mock = false
                    defaults.set(false, forKey: "mock")
                    mockeryModeSwitch.accessoryType = .none
                }
                if (GlobalVar.lower==true) {
                    GlobalVar.lower = false
                    defaults.set(false, forKey: "lower")
                    lowercaseSwitch.accessoryType = .none
                    if let indexPath = tableView.indexPathForSelectedRow {
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
                    return
                }
                if (GlobalVar.lower==true) {
                    GlobalVar.lower = false
                    defaults.set(false, forKey: "lower")
                } else {
                    GlobalVar.lower = true
                    defaults.set(true, forKey: "lower")
                }
                lowercaseSwitch.accessoryType = .checkmark
            case 2:
                if (GlobalVar.scream==true) {
                    GlobalVar.scream = false
                    defaults.set(false, forKey: "scream")
                    screamingModeSwitch.accessoryType = .none
                    if let indexPath = tableView.indexPathForSelectedRow {
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
                    return
                }
                if (GlobalVar.lower==true) {
                    GlobalVar.lower = false
                    defaults.set(false, forKey: "lower")
                    lowercaseSwitch.accessoryType = .none
                }
                if (GlobalVar.mock==true) {
                    GlobalVar.mock = false
                    defaults.set(false, forKey: "mock")
                    mockeryModeSwitch.accessoryType = .none
                }
                if (GlobalVar.scream==true) {
                    GlobalVar.scream = false
                    defaults.set(false, forKey: "scream")
                } else {
                    GlobalVar.scream = true
                    defaults.set(true, forKey: "scream")
                }
                screamingModeSwitch.accessoryType = .checkmark
            case 3:
                print("Mockery")
                if (GlobalVar.lower==true) {
                    GlobalVar.lower = false
                    defaults.set(false, forKey: "lower")
                    lowercaseSwitch.accessoryType = .none
                }
                if (GlobalVar.scream==true) {
                    GlobalVar.scream = false
                    defaults.set(false, forKey: "scream")
                    screamingModeSwitch.accessoryType = .none
                }
                if (GlobalVar.mock==true) {
                    GlobalVar.mock = false
                    defaults.set(false, forKey: "false")
                    mockeryModeSwitch.accessoryType = .none
                    if let indexPath = tableView.indexPathForSelectedRow {
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
                    return
                }
                if (GlobalVar.mock==true) {
                    GlobalVar.mock = false
                    defaults.set(false, forKey: "mock")
                } else {
                    GlobalVar.mock = true
                    defaults.set(true, forKey: "mock")
                }
                mockeryModeSwitch.accessoryType = .checkmark
            default:
                exit(-1)
            }
        } else if (indexPath.section == 2) {
            dbSwitchFunc()
        }
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    @IBAction func furrySwitched(_ sender: Any) {
        furrySwitchFunc()
    }
    
    func furrySwitchFunc() {
        if (GlobalVar.furry==true) {
            GlobalVar.furry = false
        } else {
            GlobalVar.furry = true
        }
        defaults.set(GlobalVar.furry, forKey: "furry")
        furrySwitch.setOn(GlobalVar.furry, animated: true)
    }

    
    func dbSwitchFunc() {
        darkBlockChainSwitch.setOn(!darkBlockChainSwitch.isOn, animated: true)
    }
    
    
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
