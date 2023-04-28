//
//  SettingsController.swift
//  Runner
//
//  Created by MED YASSINE MESSAOUD on 5/4/2023.
//

import UIKit

class SettingsController: UIViewController {

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
        

        // Do any additional setup after loading the view.
    }
    
   
   
    

}
