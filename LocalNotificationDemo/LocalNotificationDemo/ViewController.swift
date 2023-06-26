//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Mac on 22/06/23.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          //step 1- ask permission from user
        let notificationCentre = UNUserNotificationCenter.current()
        notificationCentre.requestAuthorization(options: [.alert,.badge,.sound]) { granted, error in
            if error == nil{
                print("user permission granted:\(granted)")
            }
        }
        //step 2-create notification content
        let content = UNMutableNotificationContent()
        content.title = "iOS Developer"
        content.body = "Demo of push Notification"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "Redmi Oppo Tune ! Notification.m4r"))
       
           //step 3- notification trigger
        let date = Date().addingTimeInterval(8)
        let datecomponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: datecomponents, repeats: false)
        
           //step 4 -create request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
           //step 5- register with notification requst
        notificationCentre.add(request){ (error) in
        }
    }
}

