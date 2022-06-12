//
//  ViewController.swift
//  Quiz15
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var isOn = true
    var isRed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "lamp_on.png")
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! editViewController
        
        editViewController.isOn = isOn
        editViewController.isRed = isRed
        
        editViewController.delegate = self
    }
}



extension ViewController: EditDelegate{
    func didMessangeEditDone(_ controller: editViewController, isOn: Bool, isRed: Bool) {
        
        if isOn == true{
            
            if isRed == true{
                imageView.image = UIImage(named: "lamp_red.png")
                self.isOn = true
                self.isRed = true
            }else{
                imageView.image = UIImage(named: "lamp_on.png")
                self.isOn = true
                self.isRed = false
        }
       
        }else{
        imageView.image = UIImage(named: "lamp_off.png")
        self.isOn = false
        self.isRed = false
    
    }
        
    }
}
