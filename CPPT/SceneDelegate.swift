//
//  SceneDelegate.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        isUserNotSignIn {
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnboardingVC")
            vc.modalPresentationStyle = .fullScreen

            self.window?.makeKeyAndVisible()
            self.window?.rootViewController?.present(vc, animated: true, completion: nil)
        }
    }
}
