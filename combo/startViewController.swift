//
//  startViewController.swift
//  combo
//
//  Created by User23 on 2019/6/21.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation
import UserNotifications
class startViewController: UIViewController , SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func web(_ sender: AnyObject) {
        if let url = URL(string: "https://medium.com/@apppeterpan")
        {
            let safari = SFSafariViewController(url: url)
            safari.delegate = self
            present(safari, animated: true, completion: nil)
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Combo Game！"
        content.subtitle = "Thank You for Your Playing"
        content.body = "Go to Start the Game"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func rule(_ sender: Any) {
        let controller = UIAlertController(title: "Introduction", message: "點擊掉落的鴨鴨來獲得分數，越接近下方圓心位置分數越高，連擊數會對分數有所加成！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
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
