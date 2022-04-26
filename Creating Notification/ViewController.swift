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


}

