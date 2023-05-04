//
//  LanguageViewController.swift
//  Runner
//
//  Created by mohamed on 4/5/2023.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var bntChangelanguage: UIButton!
    @IBOutlet weak var lblhi: UILabel!
 
    @IBOutlet weak var lbldesc: UILabel!
    @IBOutlet weak var lblanguage: UILabel!
    
    let spinner = SpinnerViewController()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblhi.text = NSLocalizedString("hello", comment: "helloa")
        lbldesc.text = NSLocalizedString("intro", comment: "desc")
        lblanguage.text = NSLocalizedString("lang", comment: "desc")
        bntChangelanguage.setTitle(NSLocalizedString("changelanguage", comment: ""), for: .normal)
    }
  
    
    @IBAction func btnChangeLanguage(_ sender: UIButton) {
        sender.shake()

          let currentLang = Locale.current.languageCode

          print("currentLang: \(currentLang ?? "")")

          let newLanguage = currentLang == "en" ? "ar" : "en"

          let alert = UIAlertController(title: "Change Language", message: "Are you sure you want to switch to \(newLanguage)?", preferredStyle: .alert)

          alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
              UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
              self.startSpinner()
              exit(0)
          }))

          present(alert, animated: true, completion: nil)
        //sender.shake()
        //let currentLang = Locale.current.languageCode
       // print("currentLang: \(currentLang ?? "")")
        
       // let newLanguage = currentLang == "en" ? "ar" : "en"
 

       // UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
//startSpinner()
       // exit(0)
        
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

}
