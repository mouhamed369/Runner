//
//  AboutViewController.swift
//  Runner
//
//  Created by mohamed on 4/5/2023.
//

import UIKit
import SwiftUI

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBSegueAction func aboutseg(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: AboutView())
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
