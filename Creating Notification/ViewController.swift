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
        UNUserNotificationCenter.current().delegate = self

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
            
            let evet = UNNotificationAction(identifier: "evet", title: "Evet", options: .foreground)
            let hayir = UNNotificationAction(identifier: "hayir", title: "Hayır", options: .foreground)
            let sil = UNNotificationAction(identifier: "sil", title: "Sil", options: .destructive)
            
            let kategori = UNNotificationCategory(identifier: "kat", actions: [evet,hayir,sil], intentIdentifiers: [], options: [])
            
            UNUserNotificationCenter.current().setNotificationCategories([kategori])
            
            
            
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "alt başlık"
            icerik.body = "5 4 ten büyük mü"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            icerik.categoryIdentifier = "kat"
            
//            var date = DateComponents()
//            date.minute = 5
//            date.hour = 18
            
            
            
            
//           let tetikleme = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "Bildirim Olusturma", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi, withCompletionHandler: nil)
        }
        else{
            
        }
        
    }
    
    
    
}

extension ViewController:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "evet"{
            print("Doğru Cevap")
        }
        
        if response.actionIdentifier == "hayir"{
            print("Yanlış Cevap")
        }
        
        if response.actionIdentifier == "sil"{
            print("Silindi")
        }
        
        completionHandler()
        
    }
}
