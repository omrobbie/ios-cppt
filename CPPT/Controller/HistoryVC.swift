//
//  HistoryVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var txtNrm: UILabel!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var imgGender: UIImageView!
    @IBOutlet weak var txtBirthDate: UILabel!
    @IBOutlet weak var txtRoomStatus: UILabel!
    @IBOutlet weak var txtAge: UILabel!

    @IBOutlet weak var txtTimestamp: UILabel!
    @IBOutlet weak var txtUserName: UILabel!
    @IBOutlet weak var txtSubjective: UILabel!
    @IBOutlet weak var txtObjective: UILabel!
    @IBOutlet weak var txtAssessment: UILabel!
    @IBOutlet weak var txtPlan: UILabel!
    @IBOutlet weak var txtInstruction: UILabel!
    @IBOutlet weak var txtReview: UILabel!
    @IBOutlet weak var imgSignature: UIImageView!

    var patient: Patient?
    var history: History?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        guard let patient = patient, let history = history else {return}

        txtNrm.text = patient.nrm
        txtName.text = patient.name
        imgGender.image = patient.gender ? #imageLiteral(resourceName: "sex-male") : #imageLiteral(resourceName: "sex-female")
        txtBirthDate.text = patient.birthDate.toString()
        txtRoomStatus.text = patient.roomStatus
        txtAge.text = patient.birthDate.toAge()

        txtTimestamp.text = history.timestamp.toString(format: .dateTime)
        txtUserName.text = history.userName
        txtSubjective.text = history.subjective
        txtObjective.text = history.objective
        txtPlan.text = history.plan
        txtAssessment.text = history.assessment
        txtInstruction.text = history.instruction
        txtReview.text = history.review
    }

    @IBAction func btnEditTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "InputVC") as? InputVC else {return}
        vc.patient = patient
        vc.history = history
        navigationController?.pushViewController(vc, animated: true)
    }
}
