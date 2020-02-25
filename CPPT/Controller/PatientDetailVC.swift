//
//  PatientDetailVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class PatientDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
