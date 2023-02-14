//
//  Choice.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/14.
//

import SwiftUI

struct Choice: View {
    var body: some View {
        ZStack{
            Text(".")
                .padding(.horizontal,153)
                .padding(.vertical,32)
                .background(Color.brown)
                .font(.title)
                .cornerRadius(40)
            Text("choice")
                    .foregroundColor(.white)
                    .padding(.horizontal,110)
                    .padding(.vertical,25)
                    .background(Color.gray)
                    .font(.title)
                    .cornerRadius(30)
                    
                
                Image(systemName:"questionmark.circle")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .offset(x:-130)
        }
    }
}
struct Choice_Previews: PreviewProvider {
    static var previews: some View {
        Choice()
    }
}
