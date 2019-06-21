//
//  gameoverViewController.swift
//  combo
//
//  Created by User23 on 2019/6/21.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

class gameoverViewController: UIViewController {

    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var lastscore: UILabel!
    
    var score : String?
    
    func ShowResult()
    {
        
        let numone = UserDefaults.standard.integer(forKey: "fir")
        let numtwo = UserDefaults.standard.integer(forKey: "sec")
        let numthree = UserDefaults.standard.integer(forKey: "thi")
        
        lastscore.text = score
        if let nowscore = score, let newscore = Int(nowscore)
        {
            if newscore > numone {
            UserDefaults.standard.set(newscore, forKey: "fir")
                one.text = nowscore
            }
            
            else if newscore > numtwo {
                UserDefaults.standard.set(newscore, forKey: "sec")
                two.text = nowscore
            }
            
            else if newscore > numthree {
                UserDefaults.standard.set(newscore, forKey: "thi")
                three.text = nowscore
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ones = UserDefaults.standard.integer(forKey: "fir")
        one.text = String(ones)
        let twos = UserDefaults.standard.integer(forKey: "sec")
        two.text = String(twos)
        let thrs = UserDefaults.standard.integer(forKey: "thi")
        three.text = String(thrs)
        
        ShowResult()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func again(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "second") {
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func home(_ sender: Any) {
    
        if let controller = storyboard?.instantiateViewController(withIdentifier: "first") {
        present(controller, animated: true, completion: nil)
    }
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
