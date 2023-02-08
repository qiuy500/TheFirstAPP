//
//  Student.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/1.
//


import SwiftUI

struct Student:Identifiable,Codable{
    
    var id:String
    var name:String
    var dID:String
    var pencils:[String]
}
