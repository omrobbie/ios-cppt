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

    init(documentId: String, nrm: String, name: String, gender: Bool, birthTimeStamp: Timestamp, roomStatus: String) {
        self.documentId = documentId
        self.nrm = nrm
        self.name = name
        self.gender = gender
        self.birthDate = birthTimeStamp.dateValue()
        self.roomStatus = roomStatus
    }

    class func parseData(snapshot: QuerySnapshot?) -> [Patients] {
        var patients = [Patients]()
        guard let snapshot = snapshot else {return patients}

        for document in snapshot.documents {
            let data = document.data()
            let documentId = document.documentID

            let nrm = data[NRM] as? String ?? ""
            let name = data[NAME] as? String ?? ""
            let gender = data[GENDER] as? Bool ?? true
            let birthDateTimestamp = data[BIRTH_DATE] as? Timestamp ?? Timestamp()
            let roomStatus = data[ROOM_STATUS] as? String ?? ""

            let newElement = Patients(documentId: documentId, nrm: nrm, name: name, gender: gender, birthTimeStamp: birthDateTimestamp, roomStatus: roomStatus)
            patients.append(newElement)
        }

        return patients
    }
}
