//
//  NotificationController.swift
//  Runner
//
//  Created by MED YASSINE MESSAOUD on 5/4/2023.
//

import UIKit

class NotificationController: UIViewController {

    @IBOutlet weak var ssend: UIButton!
    @IBOutlet weak var send: UILabel!
    @IBOutlet weak var remember: UILabel!
    @IBOutlet weak var datePiker: UIDatePicker!
    @IBOutlet weak var datapiker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        send.text = NSLocalizedString("Send Remember Me", comment: "")
        remember.text = NSLocalizedString("Remember Me", comment: "")
        ssend.setTitle(NSLocalizedString("Send", comment: ""), for: .normal)
        //UNUserNotificationCenter.current()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendnotif(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization( options: [.alert, .sound, .badge]) { granted , error in
            if granted {
                print("granted")
                DispatchQueue.main.async {
                    self.scheduleNotification()

                }
            
            } else {
                print("denied")
            }
            
        }
        
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.subtitle = "Let's Run"
        content.body = "Remember Me"
        content.badge = 1
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let date =  datePiker.date
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents( [.year, .month, .day, .hour, .minute, .second], from: date), repeats: false)
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    
    @IBAction func btnRemoveRemember(_ sender: Any) {
        
            //.removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: ["textNotification"])
        
    }
    
}
