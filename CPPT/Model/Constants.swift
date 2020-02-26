//
//  Constants.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Firebase

let REF_PATIENT = "patient"

let NRM = "nrm"
let NAME = "name"
let GENDER = "gender"
let BIRTH_DATE = "birthDate"
let ROOM_STATUS = "roomStatus"

var refPatients: CollectionReference = Firestore.firestore().collection(REF_PATIENT)
var listenPatients: ListenerRegistration?

func removeListener(listener: ListenerRegistration?) {
    if let listener = listener {
        listener.remove()
    }
}
