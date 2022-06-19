//
//  DBModel.swift
//  ServerJson_01
//
//  Created by TJ on 2022/06/19.
//

import Foundation



struct DBModel{
    // Properties
    var scode: String
    var sphone: String
    var sname: String
    var sdept: String


    
//    Constructor
    init(scode: String,sphone: String, sname: String, sdept: String){
        
        self.scode = scode
        self.sphone = sphone
        self.sname = sname
        self.sdept = sdept

    }
    

}
