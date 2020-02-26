//
//  HomeVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtSearch: UISearchBar!

    private var patients = [Patient]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        txtSearch.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listenerStart()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        listernerRemove()
    }

    func listenerStart() {
        let search = txtSearch.text ?? ""

        if search.isEmpty {
            listenerRegister = refPatient.order(by: NAME).addSnapshotListener({ (snapshot, error) in
                if let error = error {
                    alertMessage(sender: self, type: .error, message: error.localizedDescription, completion: nil)
                    return
                }

                self.patients = Patient.parseData(snapshot: snapshot)
                self.tableView.reloadData()
            })
        } else {
            listenerRegister = refPatient.order(by: NAME).whereField(NAME, in: [search]).addSnapshotListener({ (snapshot, error) in
                if let error = error {
                    alertMessage(sender: self, type: .error, message: error.localizedDescription, completion: nil)
                    return
                }

                self.patients = Patient.parseData(snapshot: snapshot)
                self.tableView.reloadData()
            })
        }
    }

    func foundQRCode(code: String) {
        refPatient.whereField(NRM, in: [code]).getDocuments { (snapshot, error) in
            if let error = error {
                alertMessage(sender: self, type: .error, message: error.localizedDescription, completion: nil)
                return
            }

            guard let snapshot = snapshot else {return}
            let patient = Patient.parseData(snapshot: snapshot)

            if patient.count > 0 {
                self.segueToPatientDetail(patient: patient[0])
            } else {
                alertMessage(sender: self, type: .info, message: "Data QRCode tidak ditemukan!", completion: nil)
            }
        }
    }

    func segueToPatientDetail(patient: Patient) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PatientDetailVC") as? PatientDetailVC else {return}
        vc.patient = patient
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnMoreTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Menu", message: nil, preferredStyle: .actionSheet)
        let actionCancel = UIAlertAction(title: "Batal", style: .cancel, handler: nil)

        let actionLogout = UIAlertAction(title: "Keluar", style: .default) { (_) in
            signOut(sender: self) {
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingVC") else {return}
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }

        alert.addAction(actionLogout)
        alert.addAction(actionCancel)

        present(alert, animated: true, completion: nil)
    }

    @IBAction func btnQRCodeScannerTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QRCodeVC") as? QRCodeVC else {return}
        vc.homeVC = self
        present(vc, animated: true, completion: nil)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell") as? PatientCell else {return UITableViewCell()}
        cell.setupCell(patient: patients[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        segueToPatientDetail(patient: patients[indexPath.row])
    }
}

extension HomeVC: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        listernerRemove()
        listenerStart()
    }
}
