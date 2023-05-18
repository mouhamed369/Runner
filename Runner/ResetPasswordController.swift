//
//  ResetPasswordController.swift
//  Runner
//
//  Created by mohamed on 18/5/2023.
//

import UIKit

class ResetPasswordController: UIViewController {

    @IBOutlet weak var codeInput: UITextField!
    @IBOutlet weak var pwdInput: UITextField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    private var viewModel = GenCodeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        btnSubmit.isEnabled = false
        
        let codeV = codeInput.text ?? ""
        let passwordV = pwdInput.text ?? ""
        
        if codeV.isEmpty  {
            
            let alertController = Alert.makeAlert(titre: "Attention", message: "Please Create Code")
            self.present(alertController, animated: true, completion: nil)
            btnSubmit.isEnabled = true
            return
        }
        if passwordV.isEmpty{
            
            let alertController = Alert.makeAlert(titre: "Attention", message: "Please Create a New Password")
            self.present(alertController, animated: true, completion: nil)
            btnSubmit.isEnabled = true
            return
            
        }
        
        Task {
            let result = await viewModel.handleResetPassword(password: passwordV, code: codeV)
            
            if result == 200 {
                performSegue(withIdentifier: "loginRSeg", sender: sender)
            }
            else {
                let alertController = Alert.makeAlert(titre: "Error", message: "Could not find email")
                self.present(alertController, animated: true)
                btnSubmit.isEnabled = true
            }
        }
        
    }
}
