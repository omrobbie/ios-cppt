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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func foundQRCode(code: String) {
        print("QRCode Scanner Result: \(code)")
    }

    @IBAction func btnMoreTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Menu", message: nil, preferredStyle: .actionSheet)
        let actionCancel = UIAlertAction(title: "Batal", style: .cancel, handler: nil)

        let actionLogout = UIAlertAction(title: "Logout", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
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
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell") as? PatientCell else {return UITableViewCell()}

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PatientDetailVC") else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}
