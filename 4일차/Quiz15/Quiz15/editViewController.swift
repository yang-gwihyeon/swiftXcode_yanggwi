//
//  editViewController.swift
//  Quiz15
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class editViewController: UIViewController {

 
    @IBOutlet weak var swtichOn: UISwitch!
    @IBOutlet weak var switchRed: UISwitch!
    
    var isOn: Bool = false
    var isRed: Bool = true
    
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swtichOn.isOn = isOn
        switchRed.isOn = isRed
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func isDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessangeEditDone(self, isOn: isOn, isRed: isRed)
        }
        navigationController?.popViewController(animated: true)    }
    
    
    
    @IBAction func switchOn(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }else{
            isOn = false
        }
       
        
    }
    
    
    
    @IBAction func switchRed(_ sender: UISwitch) {
        if sender.isOn{
            isRed = true
        }else{
            isRed = false
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
