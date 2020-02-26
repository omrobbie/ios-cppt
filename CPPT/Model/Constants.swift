//
//  Constants.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Firebase

let REF_PATIENTS = "patients"

let NRM = "nrm"
let NAME = "name"
let GENDER = "gender"
let BIRTH_DATE = "birthDate"
let ROOM_STATUS = "roomStatus"

var refPatients: CollectionReference = Firestore.firestore().collection(REF_PATIENTS)
var listenPatients: ListenerRegistration!

func removeListener(listener: ListenerRegistration) {
    if listener != nil {
        listener.remove()
    }
}
