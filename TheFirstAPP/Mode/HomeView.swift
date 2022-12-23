//
//  HomeView.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TabView{
                FirstgradeView()
                    .tabItem(){
                        Text("一年級")
                    }
                SencondgradeView()
                    .tabItem(){
                        Text("二年級")
                    }
                ThirdgradeView()
                    .tabItem(){
                        Text("三年級")
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
