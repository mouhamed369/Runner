//
//  HomeController.swift
//  Runner
//
//  Created by mohamed on 14/4/2023.
//

import UIKit
import SwiftUI


class HomeController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBSegueAction func ArtSeg(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ArticlesListView())
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func bb(_ sender: Any) {
        let  contentView = ContentView()
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.didMove(toParent: self)
    }
    
}
