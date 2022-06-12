//
//  DetailViewController.swift
//  table
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detail: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var receiveItem = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detail.text = receiveItem
        imageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
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
