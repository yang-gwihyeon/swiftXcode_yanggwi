//
//  ViewController.swift
//  Quiz31
//
//  Created by TJ on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var tfSum2: UITextField!
    
    @IBOutlet weak var tfSumResult: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func tfSum(_ sender: UIButton) {
        
        
        guard let strNum1 = tfNum1.text else { return }
        guard let strNum2 = tfNum2.text else { return }
        
        let num1Check: Int = checkNil(str: strNum1)
        let num2Check: Int = checkNil(str: strNum2)
        
        
        if num1Check+num2Check != 2{
            lblMessage.text = "숫자를 입력하세요!"
        }else{
            
            if Int(strNum1)! % 2 == 0 && Int(strNum2)! % 2 == 0 {
                
                lblMessage.text = ""
                calculation(calcNum1: strNum1, calcNum2: strNum2)
                
                lblMessage.text = "계산이 완료 되었습니다!"
            }else if Int(strNum1)! % 2 == 0 && Int(strNum2)! % 2 == 1{
                lblMessage.text = "2번째 숫자가 짝수가 아닙니다.!"
            }else if Int(strNum1)! % 2 == 1 && Int(strNum2)! % 2 == 0{
                lblMessage.text = "1번째 숫자가 짝수가 아닙니다.!"
            }else{
                lblMessage.text = "둘다 짝수가 아닙니다."
            }
            

        }
        
    }
    
    
    
        

    
    
    func checkNil(str: String) -> Int{
        //글자 앞뒤 띄어쓰기 제거
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func calculation(calcNum1: String, calcNum2: String) {
        let intNum1: Int = Int(calcNum1)!
        let intNum2: Int = Int(calcNum2)!
        
        tfSum2.text = "\(intNum1 + intNum2)"



        
    }
    
    
}

