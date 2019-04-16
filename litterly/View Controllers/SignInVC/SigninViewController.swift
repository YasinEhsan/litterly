//
//  SigninViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/5/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import Lottie

class SigninViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        signInUser()
    }
    
    //sets up the auth system to sign in/sign up the user
    func signInUser(){
        //init authUI
        let authUI = FUIAuth.defaultAuthUI()
        
        //if authUI is nil, log the error and display alert
        if authUI == nil{
            //log error
            return
        }
        
        //setting authUI's delegate to self
        authUI?.delegate = self
        
        //providers take the sign-in methods that we will use
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth()
        ]
        authUI?.providers = providers
        
        //init an access to the authUI VC
        let authViewController = authUI!.authViewController()
        
        //present the authUI VC so the user can log in
        present(authViewController, animated: true, completion: nil)
    }
    
}

//gotta extend FUIAuthDelegate so we can have some callback funcs
extension SigninViewController: FUIAuthDelegate{
    
    //this func is necessary for google and facebook signin
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        return FUIAuthPickerViewController(nibName: "AuthPickerViewController",
                                           bundle: Bundle.main,
                                           authUI: authUI)
    }
    
    //this is the call back func after the user signs in, we can get basic user info here
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        
        //if error exits, log the error
        if error != nil{
            //log the error
            return
        }
        
        performSegue(withIdentifier: "MapsViewController", sender: self)
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapsViewController"{
            print("Going to maps VC now")
        }
    }
    
    //TODO: 
    
}
