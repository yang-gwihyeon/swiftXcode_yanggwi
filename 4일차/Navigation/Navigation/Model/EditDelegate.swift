//
//  EditDelegate.swift
//  Navigation
//
//  Created by TJ on 2022/06/12.
//

import Foundation

protocol EditDelegate{
    
    func didMessangeEditDone(_ controller: EditViewcontroller, message: String)
    
//    func didImgEdit(_ controller: EditViewcontroller, imgName: String)
    
    func didSwitchEdit(_ controller: EditViewcontroller, switchOn: Bool)
}
