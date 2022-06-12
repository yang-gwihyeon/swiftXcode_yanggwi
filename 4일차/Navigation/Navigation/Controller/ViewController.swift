//
//  ViewController.swift
//  Navigation01
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn =  true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewcontroller
        
        if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "Segue :  Use BarButton"
        }else{
            editViewController.textWayValue = "Segue : Use Button"
        }
        
        editViewController.textMessage = tfMessage.text!
        
  
            editViewController.isOn = isOn
    
      
        
        
        
        editViewController.delegate = self
        
    }
    
    
    
    //델리게이트 있어서 필요없음
    
//    override func viewWillAppear(_ animated: Bool) {
//        tfMessage.text = Message.message
//        if Message.isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
//
//
//    }

 
}//

extension ViewController: EditDelegate{
    
    func didSwitchEdit(_ controller: EditViewcontroller, switchOn: Bool) {
        
        
        if switchOn == true {
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    
//    func didImgEdit(_ controller: EditViewcontroller, imgName: String) {
//        imgView.image = UIImage(named: imgName)
//    }
    
    
    func didMessangeEditDone(_ controller: EditViewcontroller, message: String) {
        tfMessage.text = message
    }
    
    
}
