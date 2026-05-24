//
//  SettingsViewController.swift
//  tip_calc
//
//  Created by Gerard Recinto on 1/7/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

@MainActor
class SettingsViewController: UIViewController {

    @IBOutlet weak var tippyCtrl: UISegmentedControl!

    private let defaults = UserDefaults.standard
    private let tipPercentages = [0.18, 0.20, 0.25]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.secondarySystemBackground
        tippyCtrl.selectedSegmentIndex = defaults.integer(forKey: "index")
    }

    @IBAction func save(_ sender: Any) {
        defaults.set(tippyCtrl.selectedSegmentIndex, forKey: "index")
        defaults.set(tipPercentages[tippyCtrl.selectedSegmentIndex], forKey: "percent")
    }
}
