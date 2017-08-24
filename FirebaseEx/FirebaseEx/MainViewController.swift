//
//  MainViewController.swift
//  FirebaseEx
//
//  Created by JaesungMoon on 2017/08/19.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI

import FirebaseGoogleAuthUI

import FirebaseFacebookAuthUI
import FirebaseTwitterAuthUI

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .green
        
        checkIfUserIsLoggedIn()
    }

    private func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleShowLogin), with: nil, afterDelay: 0)
        } else {
            print("ログイン中 id = \(Auth.auth().currentUser!.uid)")
            print("ログイン中 name = \(String(describing: Auth.auth().currentUser?.displayName))")
            
            
            //もし既存ユーザーからログアウトしたい場合は下記を実行してください。
            //            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
    }
    func handleShowLogin() {
        let authUI: FUIAuth? = FUIAuth.defaultAuthUI()
        authUI?.providers = getListOfIDPs()
        
        let controller = authUI!.authViewController()
        self.present(controller, animated: true, completion: nil)
    }
    
    private func getListOfIDPs() -> [FUIAuthProvider] {
        var providers = [FUIAuthProvider]()
        providers.append(FUIGoogleAuth())
        providers.append(FUITwitterAuth())
        providers.append(FUIFacebookAuth())
        
        return providers
    }
}

