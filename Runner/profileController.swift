//
//  profileController.swift
//  Runner
//
//  Created by mohamed on 6/4/2023.
//

import UIKit

class profileController: UIViewController {

    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "edit", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}