//
//  ViewController.swift
//  lightOnOff
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var switchOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: "lamp_off")
        
        
    }
    
  
    
    
    @IBAction func bntOn(_ sender: UIButton) {
        
        if switchOn == false{
            imageView.image = UIImage(named: "lamp_on")
            switchOn = true
        }else{
            on_alert()
        }
        
        
    }
    
    
    
    
    
    @IBAction func bntOff(_ sender: UIButton) {
        if switchOn == true{
            imageView.image = UIImage(named: "lamp_off")
            switchOn = false
        }else{
            off_alert()
        }
        
    }
    
    
    @IBAction func bntRemove(_ sender: UIButton) {
        
        remove_alert()
        
    }
    
    
    
    func on_alert(){
    let testAlert = UIAlertController(title: "경고", message: "이미 켜져있습니다.", preferredStyle: .alert)
        
    present(testAlert, animated: true, completion: nil)
        
    // UIAlertAction
        let actionDefault = UIAlertAction(title: "확인.", style: .default, handler: nil)
        
    //UIAlertController에 AlertAction 띄우기
    testAlert.addAction(actionDefault)

    }
    
    
    
    
    func off_alert(){
        let testAlert = UIAlertController(title: "경고", message: "이미 꺼져있습니다.", preferredStyle: .alert)
        
    present(testAlert, animated: true, completion: nil)
        
    // UIAlertAction
        let actionDefault = UIAlertAction(title: "확인.", style: .default, handler: nil)
        
    //UIAlertController에 AlertAction 띄우기
    testAlert.addAction(actionDefault)

    }
    
    
    
    
    func remove_alert(){
        let testAlert = UIAlertController(title: "경고", message: "정말 제거하시겠습니까?.", preferredStyle: .alert)
        
    present(testAlert, animated: true, completion: nil)
        
    // UIAlertAction
        let actionDefault = UIAlertAction(title: "아니요, 켭니다.", style: .default){ (action:UIAlertAction!) in
            remove_on()
        }
        
        let actionOff = UIAlertAction(title: "아니요, 끕니다.", style: .default){ (action:UIAlertAction!) in
            remove_off()
        }
        
        let actionRemove = UIAlertAction(title: "예, 제거합니다.", style: .default){ (action:UIAlertAction!) in
            remove()
        }
        
     
     
        
      
    //UIAlertController에 AlertAction 띄우기
    testAlert.addAction(actionDefault)
    testAlert.addAction(actionOff)
    testAlert.addAction(actionRemove)
        
        
        func remove_on() {
            
            if switchOn == true {
                on_alert()
            }else{
                imageView.image = UIImage(named: "lamp_on")
                switchOn = true
            }
            
            
        }
        
        
        func remove_off() {
            
            if switchOn == false {
                off_alert()
            }else{
                imageView.image = UIImage(named: "lamp_off")
                switchOn = false
            }
            
            
        }
        
        func remove() {
            
        imageView.image = UIImage(named: "lamp_remove")
         
            
            
        }

        
    }
}

