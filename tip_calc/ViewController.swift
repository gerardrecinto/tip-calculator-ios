//
//  ViewController.swift
//  tip_calc
//
//  Created by Gerard Recinto on 12/28/16.
//  Copyright © 2016 Gerard Recinto. All rights reserved.
//

import UIKit

@MainActor
class ViewController: UIViewController {

    @IBOutlet var tipView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var segView: UIView!

    private let tipPercentages = [0.18, 0.20, 0.25]
    private let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        billField.becomeFirstResponder()

        let savedIndex = defaults.integer(forKey: "index")
        tipControl.selectedSegmentIndex = savedIndex

        totalLabel.isHidden = true
        tipControl.isHidden = true
        tipLabel.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let savedIndex = defaults.integer(forKey: "index")
        tipControl.selectedSegmentIndex = savedIndex
        recalculate()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        recalculate()
        totalLabel.isHidden = false
        tipControl.isHidden = false
        tipLabel.isHidden = false
    }

    private func recalculate() {
        let bill = Double(billField.text ?? "") ?? 0
        let percent = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * percent
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    private func applyTheme() {
        view.backgroundColor = UIColor.systemIndigo
        segView.backgroundColor = UIColor.systemIndigo
        tipView.backgroundColor = UIColor.systemIndigo

        [totalLabel, tipLabel].forEach {
            $0?.textColor = .white
            $0?.font = UIFont.monospacedDigitSystemFont(ofSize: 24, weight: .semibold)
        }

        billField.keyboardType = .decimalPad
        billField.textAlignment = .center
    }
}
