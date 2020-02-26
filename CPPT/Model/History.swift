//
//  History.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation
import Firebase

class History {

    private(set) var documentId: String!
    private(set) var subjective: String!
    private(set) var objective: String!
    private(set) var assessment: String!
    private(set) var plan: String!
    private(set) var instruction: String!
    private(set) var review: String!
    private(set) var userName: String!
    private(set) var userType: String!
    private(set) var timestamp: Date!

    init(documentId: String, subjective: String, objective: String, assessment: String, plan: String, instruction: String, review: String, userName: String, userType: String, timestampServer: Timestamp) {
        self.documentId = documentId
        self.subjective = subjective
        self.objective = objective
        self.assessment = assessment
        self.plan = plan
        self.instruction = instruction
        self.review = review
        self.userName = userName
        self.userType = userType
        self.timestamp = timestampServer.dateValue()
    }

    class func parseData(snapshot: QuerySnapshot?) -> [History] {
        var histories = [History]()
        guard let snapshot = snapshot else {return histories}

        for document in snapshot.documents {
            let data = document.data()
            let documentId = document.documentID

            let subjective = data[SUBJECTIVE] as? String ?? ""
            let objective = data[OBJECTIVE] as? String ?? ""
            let assessment = data[ASSESSMENT] as? String ?? ""
            let plan = data[PLAN] as? String ?? ""
            let instruction = data[INSTRUCTION] as? String ?? ""
            let review = data[REVIEW] as? String ?? ""
            let userName = data[USER_NAME] as? String ?? ""
            let userType = data[USER_TYPE] as? String ?? ""
            let timestampServer = data[TIMESTAMP] as? Timestamp ?? Timestamp()

            let newElement = History.init(documentId: documentId, subjective: subjective, objective: objective, assessment: assessment, plan: plan, instruction: instruction, review: review, userName: userName, userType: userType, timestampServer: timestampServer)
            
            histories.append(newElement)
        }

        return histories
    }
}
