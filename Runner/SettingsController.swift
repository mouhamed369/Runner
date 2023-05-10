//
//  SettingsController.swift
//  Runner
//
//  Created by MED YASSINE MESSAOUD on 5/4/2023.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var privacy: UIButton!
    @IBOutlet weak var aboutus: UIButton!
    @IBOutlet weak var remember: UIButton!
    @IBOutlet weak var lbsettings2: UILabel!
    @IBOutlet weak var account: UILabel!
    @IBOutlet weak var lbsettings: UILabel!
    @IBOutlet weak var lang: UIButton!
    
    var isLogginOut = false
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "LOGOUT", message:"Are you sur you want to logout?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive){ (action: UIAlertAction) in
            self.performSegue(withIdentifier: "logout", sender: self)
            
            
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(logoutAction)
        self.present(alertController,animated: true,completion: nil)
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let navController = appDelegate.window?.rootViewController as? UINavigationController
        //navController.popToRootViewController(animated: true)
        //present(alertController,animated: true,completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "logout"{
            if let destination = segue.destination as? ViewController {
              //  destination.isLogginOut = true
            }
            //let viewController = UIStoryboard.instantiateViewController(withIdentifier: "viewController")
            
          
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if isLogginOut{
        let alertController = UIAlertController( title: "logged Out", message:"you have been succssefully logged out ", preferredStyle: .alert )
        let okAction = UIAlertAction(title: "Ok", style: .default,handler: nil)
        alertController.addAction(okAction)
        self.present(alertController,animated: true,completion: nil)
        }
        
        lang.setTitle(NSLocalizedString("language", comment: ""), for: .normal)
        privacy.setTitle(NSLocalizedString("privacy", comment: ""), for: .normal)
        aboutus.setTitle(NSLocalizedString("aboutus", comment: ""), for: .normal)
        remember.setTitle(NSLocalizedString("remeberme", comment: ""), for: .normal)
        account.text = NSLocalizedString("account", comment: "desc")
        lbsettings2.text = NSLocalizedString("settings", comment: "desc")
        lbsettings.text = NSLocalizedString("settings", comment: "desc")

        
        // Do any additional setup after loading the view.
    }
    
   
   
    

}
