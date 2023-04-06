//
//  SignUpController.swift
//  Runner
//
//  Created by Mac Mini 11 on 15/3/2023.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var pwdtf: UITextField!
    @IBOutlet weak var phonetf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var nametf: UITextField!
   
    var viewModel: SingUpViewModel = SingUpViewModel()
    

    @IBAction func goToLogin(_ sender: Any) {
        
        performSegue(withIdentifier: "signInSeg", sender: sender)
    }
    
    @IBAction func signfn(_ sender: Any) {
        let name = nametf.text
        let email = emailtf.text
        let phone = phonetf.text
        let pwd = pwdtf.text
        Task {
            await viewModel.handleSignUpRequest(req: SignUpRequest(email: email!, password: pwd!,name: name!,phone: phone!))
            
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
