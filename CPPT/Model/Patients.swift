//
//  Patients.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation
import Firebase

class Patients {

    private(set) var documentId: String!
    private(set) var nrm: String!
    private(set) var name: String!
    private(set) var gender: Bool!
    private(set) var birthDate: Date!
    private(set) var roomStatus: String!

    init(documentId: String, nrm: String, name: String, gender: Bool, birthDate: Date, roomStatus: String) {
        self.documentId = documentId
        self.nrm = nrm
        self.name = name
        self.gender = gender
        self.birthDate = birthDate
        self.roomStatus = roomStatus
    }
}
