//
//  ViewController.swift
//  ServerImage_01
//
//  Created by TJ on 2022/06/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnImage(_ sender: UIButton) {
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
        let data = try? Data(contentsOf: url!)
        imgView.image = UIImage(data: data!)
    }
    
}

