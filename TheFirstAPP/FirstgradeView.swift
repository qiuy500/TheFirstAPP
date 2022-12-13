//
//  FirstgradeView.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//

import SwiftUI

struct FirstgradeView: View {
    var body: some View {
        VStack {
            TabView{
                ToMaToView()
                    .tabItem{
                        Image("tomato")
                    }
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
struct FirstgradeView_Previews: PreviewProvider {
    static var previews: some View {
        FirstgradeView()
    }
}
