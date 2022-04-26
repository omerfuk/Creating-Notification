//
//  ViewController.swift
//  Creating Notification
//
//  Created by Ömer Faruk Kılıçaslan on 26.04.2022.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    var izinKontrol = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: { (granted,error) in
            
            self.izinKontrol = granted
            
            if granted {
                print("İzin alma başarılır")
            }
            else{
                print("İzin alma başarısız")
            }
            
        })

    }

    @IBAction func bildirimOlustur(_ sender: Any) {
        
        if izinKontrol {
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "alt başlık"
            icerik.body = "mesaj"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "Bildirim Olusturma", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi, withCompletionHandler: nil)
        }
        else{
            
        }
        
    }
    
    
    
}

