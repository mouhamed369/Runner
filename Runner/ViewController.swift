//
//  ViewController.swift
//  Runner
//
//  Created by Mac Mini 11 on 15/3/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf:UITextField!
    
    var viewModel: LoginViewModel = LoginViewModel()
    
    @IBAction func goToSignUp(_ sender: Any) {
        
        performSegue(withIdentifier: "signUpSeg", sender: sender)
    }
    
    @IBAction func loginFn(_ sender: Any) {
        let email = emailTf.text
        let pwd = passwordTf.text
        
        Task {
            await viewModel.handleLoginRequest(req: LoginRequest(username: email!, password: pwd!))
            
            if (viewModel.internalError != nil) {
                print(viewModel.internalError!)
            }
            
            else {
                print(viewModel.response!)
            }
            
            performSegue(withIdentifier: "navbar", sender: sender)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

