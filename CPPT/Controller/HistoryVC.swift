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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let patient = patient else {return}
        refHistory = refPatient.document(patient.documentId).collection(REF_HISTORY)
        guard let history = history else {return}

        listenerRegister = refHistory.document(history.documentId).addSnapshotListener({ (snapshot, error) in
            if let error = error {
                alertMessage(sender: self, type: .error, message: error.localizedDescription, completion: nil)
                return
            }

            if let dataHistory = History.parseData(snapshot: snapshot) {
                self.txtTimestamp.text = dataHistory.timestamp.toString(format: .dateTime)
                self.txtUserName.text = dataHistory.userName
                self.txtSubjective.text = dataHistory.subjective
                self.txtObjective.text = dataHistory.objective
                self.txtPlan.text = dataHistory.plan
                self.txtAssessment.text = dataHistory.assessment
                self.txtInstruction.text = dataHistory.instruction
                self.txtReview.text = dataHistory.review
            }
        })
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        listernerRemove()
    }

    func setupUI() {
        guard let patient = patient else {return}

        txtNrm.text = patient.nrm
        txtName.text = patient.name
        imgGender.image = patient.gender ? #imageLiteral(resourceName: "sex-male") : #imageLiteral(resourceName: "sex-female")
        txtBirthDate.text = patient.birthDate.toString()
        txtRoomStatus.text = patient.roomStatus
        txtAge.text = patient.birthDate.toAge()
    }

    @IBAction func btnEditTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "InputVC") as? InputVC else {return}
        vc.patient = patient
        vc.history = history
        navigationController?.pushViewController(vc, animated: true)
    }
}
