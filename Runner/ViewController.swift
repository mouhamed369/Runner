//
//  ViewController.swift
//  Runner
//
//  Created by Mac Mini 11 on 15/3/2023.
//

import UIKit
import SwiftUI
import LocalAuthentication

class ViewController: UIViewController {
    
    
    @IBOutlet weak var faceIDButton: UIButton!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf:UITextField!
    let spinner = SpinnerViewController()
    
    
    var viewModel: LoginViewModel = LoginViewModel()
    
    @IBAction func goToSignUp(_ sender: Any) {
        
        performSegue(withIdentifier: "signUpSeg", sender: sender)
    }
    
    func startSpinner() {
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    func stopSpinner() {
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
    @IBAction func loginFn(_ sender: UIButton) {
        sender.shake()
        
        let email = emailTf.text
        let pwd = passwordTf.text
        
        Task {
            await viewModel.handleLoginRequest(req: LoginRequest(username: email!, password: pwd!))
            if (emailTf.text == "")  {
                makeAlert(titre: "Warning", message: "Please type your email")
                return
            }//else if ((emailTf.text != nil) ){
                //makeAlert(titre: "Warning", message: "Please type your email correctly")
               // return
           // }
            
            if (passwordTf.text == "") {
                makeAlert(titre: "Warning", message: "Please type the password ")
                return
            }
           if (passwordTf.text != pwd) {
                makeAlert(titre: "Warning", message: "Password and confirmation don't match")
                return
            }
           
            if (viewModel.internalError != nil) {
               print(viewModel.internalError!)
           }
            
            else {
                print(viewModel.response!)
            };
         
                performSegue(withIdentifier: "navbar", sender: sender)
                startSpinner()
            

            
                        
            
        }
    }
    
    
    @IBAction func faceIDButtonTapped(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Log in with Face ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, error) in
                if success {
                    // Authentication successful, perform segue or other action
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "navbar", sender: self)
                    }
                } else {
                    // Authentication failed, show error message
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Authentication Failed", message: error?.localizedDescription ?? "Please try again", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        } else {
            // Face ID not available, show error message
            let alertController = UIAlertController(title: "Face ID Not Available", message: error?.localizedDescription ?? "Your device does not support Face ID", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func makeAlert(titre: String?, message: String?) {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

