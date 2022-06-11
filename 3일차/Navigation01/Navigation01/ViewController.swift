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
    let imgOff = UIImage(named: "lamep_off_png")
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
        
        Message.message = tfMessage.text!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfMessage.text = Message.message
        if Message.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }

 
}//

