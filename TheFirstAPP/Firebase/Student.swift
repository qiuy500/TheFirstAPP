//
//  Student.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/1/9.
//


import SwiftUI

struct Student:Identifiable,Codable{
    
    var id:String
    var name:String
    var dID:String
    var pencils:[String]
}
