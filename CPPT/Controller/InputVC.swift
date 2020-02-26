//
//  InputVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import SignaturePad
import Firebase

class InputVC: UIViewController {

    @IBOutlet weak var txtNrm: UILabel!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var imgGender: UIImageView!
    @IBOutlet weak var txtBirthDate: UILabel!
    @IBOutlet weak var txtRoomStatus: UILabel!
    @IBOutlet weak var txtAge: UILabel!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    @IBOutlet weak var signaturePad: SignaturePad!
    @IBOutlet weak var btnSignatureStart: CustomUIButton!

    @IBOutlet weak var txtSubjective: CustomUITextView!
    @IBOutlet weak var txtObjective: CustomUITextView!
    @IBOutlet weak var txtAssessment: CustomUITextView!
    @IBOutlet weak var txtPlan: CustomUITextView!
    @IBOutlet weak var txtInstruction: CustomUITextView!
    @IBOutlet weak var txtReview: CustomUITextView!

    var patient: Patient?
    var history: History?

    var name: String?
    var type: String?

    private var constraintBottomDefault: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        constraintBottomDefault = constraintBottom.constant

        isUserSignIn { (uid) in
            let document = refUser.document(uid)

            document.getDocument { (snapshot, error) in
                guard let snapshot = snapshot else {return}
                let data = snapshot.data()

                if let data = data {
                    self.name = data[NAME] as? String ?? ""
                    self.type = data[TYPE] as? String ?? ""
                }
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardStatusObserver(self, willShow: #selector(keyboardWillShow(_:)), willHide: #selector(keyboardWillHide))

        guard let patient = patient else {return}
        refHistory = refPatient.document(patient.documentId).collection(REF_HISTORY)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        keyboardStatusObserverRemove(self)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        constraintBottom.constant = constraintBottomDefault + keyboardHeight(notification)
    }

    @objc func keyboardWillHide() {
        constraintBottom.constant = constraintBottomDefault
    }

    func setupUI() {
        guard let patient = patient else {return}

        txtNrm.text = patient.nrm
        txtName.text = patient.name
        imgGender.image = patient.gender ? #imageLiteral(resourceName: "sex-male") : #imageLiteral(resourceName: "sex-female")
        txtBirthDate.text = patient.birthDate.toString()
        txtRoomStatus.text = patient.roomStatus
        txtAge.text = patient.birthDate.toAge()

        if let history = history {
            txtSubjective.text = history.subjective
            txtObjective.text = history.objective
            txtAssessment.text = history.assessment
            txtPlan.text = history.plan
            txtInstruction.text = history.instruction
            txtReview.text = history.review
        }
    }

    @IBAction func btnSignatureStartTapped(_ sender: Any) {
        let toggle = scrollView.isScrollEnabled
        scrollView.isScrollEnabled = !toggle

        if toggle {
            btnSignatureStart.backgroundColor = #colorLiteral(red: 0.1806240082, green: 0.2743958831, blue: 0.4199774861, alpha: 1)
        } else {
            btnSignatureStart.backgroundColor = #colorLiteral(red: 0.3236097395, green: 0.4890208244, blue: 0.7480755448, alpha: 1)
        }
    }

    @IBAction func btnSignatureClearTapped(_ sender: Any) {
        signaturePad.clear()
    }

    @IBAction func btnSaveTapped(_ sender: Any) {
        let subjective = txtSubjective.text ?? ""
        let objective = txtObjective.text ?? ""
        let assessment = txtAssessment.text ?? ""
        let plan = txtPlan.text ?? ""
        let instruction = txtInstruction.text ?? ""
        let review = txtReview.text ?? ""
        let userName = name ?? ""
        let userType = type ?? ""

        Firestore.firestore().runTransaction({ (transaction, error) -> Any? in
            if let history = self.history {
                let oldDocument = refHistory.document(history.documentId)

                transaction.updateData([
                    SUBJECTIVE: subjective,
                    OBJECTIVE: objective,
                    ASSESSMENT: assessment,
                    PLAN: plan,
                    INSTRUCTION: instruction,
                    REVIEW: review,
                    USER_NAME: userName,
                    USER_TYPE: userType,
                    TIMESTAMP: FieldValue.serverTimestamp()
                ], forDocument: oldDocument)

                return nil
            }

            let newDocument = refHistory.document()

            transaction.setData([
                SUBJECTIVE: subjective,
                OBJECTIVE: objective,
                ASSESSMENT: assessment,
                PLAN: plan,
                INSTRUCTION: instruction,
                REVIEW: review,
                USER_NAME: userName,
                USER_TYPE: userType,
                TIMESTAMP: FieldValue.serverTimestamp()
            ], forDocument: newDocument)

            return nil
        }) { (object, error) in
            if let error = error {
                alertMessage(sender: self, type: .error, message: error.localizedDescription, completion: nil)
                return
            }

            self.navigationController?.popViewController(animated: true)
        }
    }
}
