//
//  ForgetPasswordView.swift
//  Runner
//
//  Created by mohamed on 7/4/2023.
//

import UIKit

class ForgetPasswordView: UIViewController {

    @IBOutlet weak var EMAIL: UITextField!
    
    private var viewModel = GenCodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func next(_ sender: Any) {
        
        var value = EMAIL.text ?? ""
        
        if (value.isEmpty || !value.contains("@")) {
            let alertController = Alert.makeAlert(titre: "Error", message: "Please enter a valid email")
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        Task {
            let result = await viewModel.handleVerifyCode(email: value)
            
            if result == 200 {
                performSegue(withIdentifier: "resetSeg", sender: sender)
            }
            else {
                let alertController = Alert.makeAlert(titre: "Error", message: "Could not find email")
                self.present(alertController, animated: true)
            }
        }
    }
}
