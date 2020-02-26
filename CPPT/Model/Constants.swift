//
//  Constants.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Firebase

let REF_PATIENT = "patient"
let REF_HISTORY = "history"

let NRM = "nrm"
let NAME = "name"
let GENDER = "gender"
let BIRTH_DATE = "birthDate"
let ROOM_STATUS = "roomStatus"

let SUBJECTIVE = "subjective"
let OBJECTIVE = "objective"
let ASSESSMENT = "assessment"
let PLAN = "plan"
let INSTRUCTION = "instruction"
let REVIEW = "review"
let USER_ID = "userId"
let TIMESTAMP = "timestamp"

var refPatient: CollectionReference = Firestore.firestore().collection(REF_PATIENT)
var refHistory: CollectionReference = refPatient

var listenPatient: ListenerRegistration?
var listenHistory: ListenerRegistration?

func removeListener(listener: ListenerRegistration?) {
    if let listener = listener {
        listener.remove()
    }
}
