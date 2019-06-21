//
//  ViewController.swift
//  combo
//
//  Created by User01 on 2019/5/29.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit
import AudioToolbox

var timer: Timer?
var gameTimer: Timer?
var down: Timer?
var miss: Timer?
var newscore:Int = 0
var newcombo:Int = 0
class ViewController: UIViewController {

    
    @IBOutlet var time: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet weak var grade: UILabel!
    
    @IBOutlet weak var honor: UIButton!
    @IBOutlet weak var burst: UIImageView!
    @IBOutlet weak var combo: UILabel!
    
    var ducks: [UIButton] = [UIButton]()
    class duck{
        var x:Int
        var y:Int
        
        
        init(){
           
            self.x = (103*(Int.random(in: 0...3)))
            self.y = 10
            
            
        }
    }
    
    @objc func press(sender: UIButton!)
    {
       /* if sender.currentImage == UIImage(named:"duck.png"){
        
            nowcombo = nowcombo+1
            combo?.text = "\(nowcombo)"
            nowscore = nowscore+10*(nowcombo/10+1)
            score?.text = "\(nowscore)"*/
        if (sender.center.y  > 828 && sender.center.y  < 868)
        {
           
            newcombo = newcombo+1
            combo?.text = "\(newcombo)"
            newscore = newscore+(newcombo/10)*50
            score?.text = "\(newscore)"
            grade.text = "Perfect"
            grade.textColor = UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
            
            let xorig = combo.center.x
            let yorig = combo.center.y
            let opts =
            UIView.AnimationOptions.autoreverse
            UIView.animate(withDuration: 0.05, delay: 0, options: opts, animations: {
                self.combo.center.x += 20
                self.combo.center.y -= 20
            }, completion: { _ in
                self.combo.center.x = xorig
                self.combo.center.y = yorig
            })
            
            let xs = burst.center.x
            let ys = burst.center.y
            let ops =
                UIView.AnimationOptions.autoreverse
            UIView.animate(withDuration: 0.05, delay: 0, options: ops, animations: {
                self.burst.center.x += 20
                self.burst.center.y -= 20
            }, completion: { _ in
                self.burst.center.x = xs
                self.burst.center.y = ys
            })
            
            
            sender.center.x += 50.5
            sender.removeFromSuperview()
            
        }
        
        else if (sender.center.y > 800 && sender.center.y  < 896)
        {
            newcombo = newcombo+1
            combo?.text = "\(newcombo)"
            newscore = newscore+(newcombo/10)*30
            score?.text = "\(newscore)"
            grade.text = "Cool"
            grade.textColor = UIColor(red: 221/255, green: 160/255, blue: 221/255, alpha: 1)
            
            let xorig = combo.center.x
            let yorig = combo.center.y
            let opts =
                UIView.AnimationOptions.autoreverse
            UIView.animate(withDuration: 0.05, delay: 0, options: opts, animations: {
                self.combo.center.x += 20
                self.combo.center.y -= 20
            }, completion: { _ in
                self.combo.center.x = xorig
                self.combo.center.y = yorig
            })
            
            
            let xs = burst.center.x
            let ys = burst.center.y
            let ops =
                UIView.AnimationOptions.autoreverse
            UIView.animate(withDuration: 0.05, delay: 0, options: ops, animations: {
                self.burst.center.x += 20
                self.burst.center.y -= 20
            }, completion: { _ in
                self.burst.center.x = xs
                self.burst.center.y = ys
            })
            
            sender.center.x += 50.5
            sender.removeFromSuperview()
            
        }
            
        
            
        else if(sender.center.y > 700 && sender.center.y  < 896)
        {
            newcombo = newcombo+1
            combo?.text = "\(newcombo)"
            newscore = newscore+(newcombo/10)*10
            score?.text = "\(newscore)"
            grade.text = "Bad"
            grade.textColor = UIColor(red: 222/255, green: 184/255, blue: 135/255, alpha: 1)
            
            let xorig = combo.center.x
            let yorig = combo.center.y
            let opts =
                UIView.AnimationOptions.autoreverse
            UIView.animate(withDuration: 0.05, delay: 0, options: opts, animations: {
                self.combo.center.x += 20
                self.combo.center.y -= 20
            }, completion: { _ in
                self.combo.center.x = xorig
                self.combo.center.y = yorig
            })
            
            
            let xs = burst.center.x
            let ys = burst.center.y
            let ops =
                UIView.AnimationOptions.autoreverse
            UIView.animate(withDuration: 0.05, delay: 0, options: ops, animations: {
                self.burst.center.x += 20
                self.burst.center.y -= 20
            }, completion: { _ in
                self.burst.center.x = xs
                self.burst.center.y = ys
            })
            
            sender.center.x += 50.5
            sender.removeFromSuperview()
            
        }
        
        else
        {
            newcombo = 0
            combo?.text = "\(newcombo)"
        newscore = newscore+0
        score?.text = "\(newscore)"
        grade.text = "Miss"
        grade.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        
        sender.center.x += 50.5
        sender.removeFromSuperview()
        
        }
        
        
       
    
        //sender.removeFromSuperview()
      
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sec = 60
        honor.isHidden = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.time.text = "1:00"
            let countSec:Int = sec % 60
            let countMin:Int = sec / 60
            self.time.text = String(countMin) + ":" + String( format: "%02d", countSec )
            //self.time.text = String(sec)
            if sec > 0
            {
                sec = sec - 1
            }
            else
            {
                for item in self.ducks{
                    item.isHidden = true
                }
                self.honor.isHidden = false
                self.grade.isHidden = true
                self.combo.isHidden = true
                self.burst.isHidden = true
                
                if timer != nil {
                    timer?.invalidate()
                    gameTimer?.invalidate()
                    down?.invalidate()
                    miss?.invalidate()
                }
            }
            
        }
        
        down = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            for item in self.ducks{
                item.center.y += 30
             
            }
        }
        //&& Int(item.center.x)  % 103 == 0
        
        miss = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            for item in self.ducks{
                if (item.center.y > 930 && item.center.y < 960 &&
                    Int(item.center.x)  % 103 != 0)
                   
                {
                    newcombo = 0
                    self.combo?.text = "\(newcombo)"
                    self.grade.text = "Miss"
                    self.grade.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
                
                    
                }
                
            }
        }
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (_) in
            if Int.random(in:  0...100)%2 == 0
            {
                let button = UIButton()
                let good = duck()
                
                    button.setImage(UIImage(named: "duck.jpg"), for: .normal)
                
               
                button.frame = CGRect(x: good.x, y:good.y, width:105,height:96)
                button.addTarget(self, action: #selector(self.press(sender:)), for: .touchUpInside)
                
                
                
                self.ducks.append(button)
                self.view.addSubview(button)
                
                
            }
            
            
        // Do any additional setup after loading the view.
    }


}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? gameoverViewController
        controller?.score = score.text
        
    }
}
