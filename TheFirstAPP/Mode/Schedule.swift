//
//  Schedule.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//

import SwiftUI

struct Schedule: View {
    var columngrid :[GridItem] = [
        GridItem(.flexible(), spacing:1),
        GridItem(.flexible(), spacing:1)
    
    ]
    var testschedule :[String] =
    ["a","b","c","d","e","f","g"]
    var body: some View {
        VStack {
            LazyVGrid(columns: columngrid){
                ForEach(0...1002,id:\.self){
                    Text(testschedule[$0 % testschedule.count])
                }
            }
        }
    }
}

struct Schedule_Previews: PreviewProvider {
    static var previews: some View {
        Schedule()
    }
}
