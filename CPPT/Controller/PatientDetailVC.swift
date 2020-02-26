//
//  PatientDetailVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class PatientDetailVC: UIViewController {

    @IBOutlet weak var txtNrm: UILabel!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var imgGender: UIImageView!
    @IBOutlet weak var txtBirthDate: UILabel!
    @IBOutlet weak var txtRoomStatus: UILabel!
    @IBOutlet weak var txtAge: UILabel!

    @IBOutlet weak var tableView: UITableView!

    var patient: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        tableView.delegate = self
        tableView.dataSource = self
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

    @IBAction func btnAddTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "InputVC") as? InputVC else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PatientDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as? HistoryCell else {return UITableViewCell()}

        if indexPath.row == 1 {
            cell.backgroundColor = .lightGray
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "HistoryVC") as? HistoryVC else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}
