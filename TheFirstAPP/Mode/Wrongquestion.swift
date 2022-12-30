//
//  Wrongquestion.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//

import SwiftUI

struct Wrongquestion: View {
    @State private var backgroundColor1 = Color.gray
    @State private var backgroundColor2 = Color.gray
    @State private var backgroundColor3 = Color.gray

    let colors1:[Color]  = [.gray,.red]
    let colors2:[Color]  = [.gray,.red]
    let colors3:[Color]  = [.gray,.red]

    var body: some View {
        VStack{
            List{
                Text("1")
                    .foregroundColor(backgroundColor1)
                    .onTapGesture(count: 1) {
                        backgroundColor1 = colors1.randomElement()!
                    }
                Text("1")
                    .foregroundColor(backgroundColor2)
                    .onTapGesture(count: 1) {
                        backgroundColor1 = colors2.randomElement()!
                    }
                Text("1")
                    .foregroundColor(backgroundColor3)
                    .onTapGesture(count: 1) {
                        backgroundColor3 = colors3.randomElement()!
                    }
            }
            
            
        }
    }
}
struct Wrongquestion_Previews: PreviewProvider {
    static var previews: some View {
        Wrongquestion()
    }
}
