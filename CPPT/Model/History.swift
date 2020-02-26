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
    private(set) var userId: String!

    init(documentId: String, subjective: String, objective: String, assessment: String, plan: String, instruction: String, review: String, userId: String) {
        self.documentId = documentId
        self.subjective = subjective
        self.objective = objective
        self.assessment = assessment
        self.plan = plan
        self.instruction = instruction
        self.review = review
        self.userId = userId
    }
}
