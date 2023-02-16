//
//  NewStudent.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/16.
//

import SwiftUI

struct NewStudent: View {
    @EnvironmentObject var studentManager: AddImage
    @State private var name = ""
    @Binding var showPopup:Bool
    
    var body: some View {
        VStack{
            TextField("名稱", text: $name)
            
            Button {
                studentManager.addStudent(name: name)
                showPopup.toggle()
            } label: {
                Text("儲存")
            }

        }
    }
}

struct NewStudent_Previews: PreviewProvider {
    static var previews: some View {
        NewStudent(showPopup: .constant(false)).environmentObject(AddImage())
    }
}
