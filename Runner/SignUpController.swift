//
//  SignUpController.swift
//  Runner
//
//  Created by Mac Mini 11 on 15/3/2023.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var singup: UIButton!
    @IBOutlet weak var loggin: UIButton!
    @IBOutlet weak var account: UILabel!
    @IBOutlet weak var pwdtf: UITextField!
    @IBOutlet weak var phonetf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var nametf: UITextField!
    let spinner = SpinnerViewController()
    var viewModel: SingUpViewModel = SingUpViewModel()
    

    @IBAction func goToLogin(_ sender: Any) {
        
        performSegue(withIdentifier: "signInSeg", sender: sender)
    }
    
    @IBAction func signfn(_ sender: UIButton) {
        let name = nametf.text
        let email = emailtf.text
        let phone = phonetf.text
        let pwd = pwdtf.text
        sender.pulsate()
        
        Task {
            await viewModel.handleSignUpRequest(req: SignUpRequest(email: email!, password: pwd!,name: name!,phone: phone!))
            if (emailtf.text!.isEmpty) {
                self.present(Alert.makeAlert(titre: "Warning", message: "Please type your  email"), animated: true)
                return
            }//else if ((emailTf.text != nil) ){
                //makeAlert(titre: "Warning", message: "Please type your email correctly")
               // return
           // }
            if (pwdtf.text!.isEmpty) {
                self.present(Alert.makeAlert(titre: "Warning", message: "Please type your  password"), animated: true)
                return
            }
            if (nametf.text!.isEmpty) {
                self.present(Alert.makeAlert(titre: "Warning", message: "Please type your name"), animated: true)
                return
            }
           // if (pwdtf.text == "") {
              //  makeAlert(titre: "Warning", message: "Please type the password ")
               // return
            //}
            if (phonetf.text!.isEmpty) {
                self.present(Alert.makeAlert(titre: "Warning", message: "Please type your phone"), animated: true)
                return
            }
            
            if (viewModel.internalError != nil) {
                print(viewModel.internalError!)
            }
            
            else {
                print(viewModel.response!)
            }
            
            performSegue(withIdentifier: "navbar", sender: sender)
            startSpinner()
        }

    }
    func makeAlert(titre: String?, message: String?) {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        account.text = NSLocalizedString("Create Account", comment: "desc")
        loggin.setTitle(NSLocalizedString("already", comment: ""), for: .normal)
        singup.setTitle(NSLocalizedString("Sign Up", comment: ""), for: .normal)
        nametf.placeholder = NSLocalizedString("name", comment: "")
        emailtf.placeholder = NSLocalizedString("Email", comment: "")
        phonetf.placeholder = NSLocalizedString("phone", comment: "")
        pwdtf.placeholder = NSLocalizedString("PASS", comment: "")
        // Do any additional setup after loading the view.
    }
    
}
