//
//  ViewController.swift
//  tabbarpage
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        let kBarHeight: Double = 100
        self.tabBarController?.tabBar.frame.size.height = kBarHeight
        self.tabBarController?.tabBar.frame.origin.y = view.frame.height - kBarHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
