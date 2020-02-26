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

    private var histories = [History]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let patient = patient else {return}
        refHistory = refPatient.document(patient.documentId).collection(REF_HISTORY)
        guard let refHistory = refHistory else {return}

        listenerRegister = refHistory.order(by: TIMESTAMP, descending: true).addSnapshotListener({ (snapshot, error) in
            if let error = error {
                alertMessage(sender: self, type: .error, message: error.localizedDescription, completion: nil)
                return
            }

            self.histories = History.parseData(snapshot: snapshot)
            self.tableView.reloadData()
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

    @IBAction func btnAddTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "InputVC") as? InputVC else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PatientDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as? HistoryCell else {return UITableViewCell()}
        let history = histories[indexPath.row]
        cell.setupCell(history: history)

        switch history.userType {
        case "Dokter":
            cell.backgroundColor = #colorLiteral(red: 0.9039862752, green: 0.8986125588, blue: 0.9081169367, alpha: 1)
        case "Perawat", "Bidan":
            cell.backgroundColor = #colorLiteral(red: 0.7701118588, green: 0.8777749538, blue: 1, alpha: 1)
        case "Gizi", "Farmasi":
            cell.backgroundColor = #colorLiteral(red: 0.9146185517, green: 1, blue: 0.890776813, alpha: 1)
        default:
            cell.backgroundColor = .none
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "HistoryVC") as? HistoryVC else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}
