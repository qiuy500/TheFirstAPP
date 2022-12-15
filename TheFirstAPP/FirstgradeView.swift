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
                Multiplechoice()
                    .tabItem{
                        Image(systemName: "pencil.line")
                    }
                Wrongquestion()
                    .tabItem{
                        Image(systemName: "book.circle")
                    }
                
            }
        }
    }
}
struct FirstgradeView_Previews: PreviewProvider {
    static var previews: some View {
        FirstgradeView()
    }
}
