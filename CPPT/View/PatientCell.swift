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

    func setupCell(patients: Patients) {
        txtNrm.text = patients.nrm
        txtName.text = patients.name
        imgGender.image = patients.gender ? #imageLiteral(resourceName: "sex-male") : #imageLiteral(resourceName: "sex-female")
        txtBirthDate.text = patients.birthDate.toString()
        txtRoomStatus.text = patients.roomStatus
        txtAge.text = patients.birthDate.toAge()
    }
}
