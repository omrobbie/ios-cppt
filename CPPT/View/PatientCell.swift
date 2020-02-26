//
//  PatientCell.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class PatientCell: UITableViewCell {
    @IBOutlet weak var txtNrm: UILabel!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var imgGender: UIImageView!
    @IBOutlet weak var txtBirthDate: UILabel!
    @IBOutlet weak var txtRoomStatus: UILabel!
    @IBOutlet weak var txtAge: UILabel!

    func setupCell(patient: Patient) {
        txtNrm.text = patient.nrm
        txtName.text = patient.name
        imgGender.image = patient.gender ? #imageLiteral(resourceName: "sex-male") : #imageLiteral(resourceName: "sex-female")
        txtBirthDate.text = patient.birthDate.toString()
        txtRoomStatus.text = patient.roomStatus
        txtAge.text = patient.birthDate.toAge()
    }
}
