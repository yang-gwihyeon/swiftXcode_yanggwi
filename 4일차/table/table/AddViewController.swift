//
//  AddViewController.swift
//  table
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var tfAddItem: UITextField!
    
    
    
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageName = ""
    
    let Max_Array_Num = 3
    let Picker_View_Column = 1
    var imageArray = [UIImage?]()
    
    var imageFileName =
    [
        "clock.png",
        "pencil.png",
        "cart.png"
     
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
        
        for i in 0..<Max_Array_Num{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        imgView.image = imageArray[0]
        
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        if tfAddItem.text!.isEmpty{
            Message.check = "Old"
        }else{
            Message.check = "New"
            Message.item = tfAddItem.text!
            Message.itemsImageFile = imageName
            
            
        }
        
        tfAddItem.text = ""
        navigationController?.popViewController(animated: true)

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

extension AddViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        Picker_View_Column
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        imageFileName.count
    }
    
    
}

extension AddViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
}
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        imgView.image = imageArray[row]
        imageName = imageFileName[row]
}
}
