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
let USER_NAME = "userName"
let USER_TYPE = "userType"
let TIMESTAMP = "timestamp"

var refPatient: CollectionReference = Firestore.firestore().collection(REF_PATIENT)
var refHistory: CollectionReference?

var listenerRegister: ListenerRegistration?

func listernerRemove() {
    if let listener = listenerRegister {
        listener.remove()
    }
}
