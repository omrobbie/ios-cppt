//
//  HistoryCell.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var txtSubjective: UILabel!
    @IBOutlet weak var txtObjective: UILabel!
    @IBOutlet weak var txtAssessment: UILabel!
    @IBOutlet weak var txtPlan: UILabel!
    @IBOutlet weak var txtUserType: UILabel!
    @IBOutlet weak var txtUserName: UILabel!

    func setupCell(history: History) {
        txtSubjective.text = "S: \(history.subjective ?? "-")"
        txtObjective.text = "O: \(history.objective ?? "-")"
        txtAssessment.text = "A: \(history.assessment ?? "-")"
        txtPlan.text = "P: \(history.plan ?? "-")"
        txtUserName.text = history.userName
        txtUserType.text = history.userType
    }
}
