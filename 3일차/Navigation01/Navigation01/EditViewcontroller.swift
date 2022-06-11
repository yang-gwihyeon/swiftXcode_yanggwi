//
//  EditViewcontroller.swift
//  Navigation01
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class EditViewcontroller: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    
    @IBOutlet weak var tfMessage: UITextField!
    
    @IBOutlet weak var lblOnOff: UILabel!
    
    @IBOutlet weak var swisOn: UISwitch!
    
    var textWayValue: String = ""
    
    var isOn: Bool = Message.isOn
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        tfMessage.text = Message.message
        
        swisOn.isOn = isOn
        
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        Message.message = tfMessage.text!
        Message.isOn = isOn
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swLamp(_ sender: UISwitch) {
        
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
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
