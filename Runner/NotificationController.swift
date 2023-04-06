//
//  NotificationController.swift
//  Runner
//
//  Created by MED YASSINE MESSAOUD on 5/4/2023.
//

import UIKit

class NotificationController: UIViewController {

    @IBOutlet weak var datapiker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendnotif(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization( options: [.alert, .sound, .badge]) { granted , error in
            if granted {
                print("granted")
                self.scheduleNotification()
            
            } else {
                print("denied")
            }
            
        }
        
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.subtitle = "Let's Run"
        content.body = "My notification"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    

}
