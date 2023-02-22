//
//  HomeView.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
           //漸層
            LinearGradient (gradient: Gradient(colors: [.gray, .white]), startPoint:
             //頂部優先，向下
                    .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image(systemName:"calendar")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 55,height: 55)
                    .padding()
                    .background(.black,in:Circle())
                Spacer()
                Text("\(Test())")
                    .font(.custom("", size: 120))
                    .minimumScaleFactor (0.5)
                
                    .foregroundColor (.black)
                    .lineLimit(1)
                    .padding( .vertical, -30)
                Spacer()
                
                
                Text("113學測倒數")
                    .foregroundColor(.white)
                    .padding(.horizontal,80)
                    .padding(.vertical,20)
                    .background(Color.gray)
                    
                    .font(.title)
                    .cornerRadius(100)
                Divider()
                    .font(.largeTitle)
                    .frame(height: 3)
                    .overlay(.white)
                Text("2024/1/20")
                    .fontWeight(.heavy)
                    .font(.title)
                Text("SCHEDULED DATE")
                    .padding(-5.0)
                
                Spacer()
            }
        }
    }
    //多少天到學測
    func Test() -> Int {
        //計算日期 日期組件
        let TestDateComponents = DateComponents (month: 1, day: 20, hour: 23, minute: 59, second: 59)
        let currentDate = Date()
       //計算下一個到達日期
        if let nextTestDate = Calendar.current.nextDate(after:currentDate,matching: TestDateComponents,matchingPolicy:.strict),
          //直到學測的天數
            let daysUntilTest = Calendar.current.dateComponents ([.day], from: currentDate, to: nextTestDate).day { return daysUntilTest}
        return 0
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
