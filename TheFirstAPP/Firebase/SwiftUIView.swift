//
//  SwiftUIView.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/1/9.
//

import SwiftUI
import Firebase
import PhotosUI

@available(iOS 16.0, *)
struct login : View {
    @EnvironmentObject var studentManager:StudentManager
    
    @State var email = ""
    @State var password = ""
    
    @State var message = ""
    
    @State var statusIsLogin = true
    
    @State var showPopup = false
    
    @State var isSecured:Bool = true
    
    @State var searchName = ""
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData:Data?
    
    @State var showImg = false
    
    var body: some View {
        
        if statusIsLogin {
            
            VStack {
                HStack{
                    TextField("輸入尋找名字", text: $searchName).onChange(of: searchName) { newValue in
                        if newValue != "" {
                            searchName = newValue
                            studentManager.findStudent(name: searchName)}else{
                                studentManager.fetechStudents()
                            }
                    }
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Label("選擇相片", systemImage: "photo")
                    }.onChange(of: selectedItem) { newValue in
                        Task{
                            if let data = try? await newValue?.loadTransferable(type: Data.self){
                                selectedPhotoData = data
                                showImg = true
                                await studentManager.upload(image: UIImage(data: data)!,name: "pictureName\(Date.now.description)")
                            }
                        }
                        
                    }

                }.padding(.horizontal, 20)
                
                if var selectedPhotoData,
                   let image = UIImage(data: selectedPhotoData){
                    if showImg {
                        VStack{
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                            .clipped()
                            Button {
                                showImg = false
                                studentManager.listAllFiles()
                            } label: {
                                Text("確定")
                            }

                        }
                    }
                }
                NavigationView {
                    List{
                        ForEach(studentManager.myPics,id:\.self){ pic in
                            HStack {
                                //註解為第二種方式
                                /*AsyncImage(url: URL(string: pic)!, placeholder: {Text("載入中.....")}, image:{Image(uiImage: $0).resizable()}).frame(width: 100, height: 100)*/
                                Button {
                                    studentManager.deleteItem(url: pic)
                                    
                                } label: {
                                    Text("刪除")
                                }

                            }
                        }
                    }
                }.onAppear{
                    studentManager.listAllFiles()
                }
                Text("\(studentManager.myPics.count)")
                /*
                NavigationView{
                    List{
                        ForEach(studentManager.students){ std in
                            HStack {
                                VStack(alignment:.center) {
                                    Text(std.id)
                                    Text(std.name)
                                    Text(std.dID)
                                    Text(std.pencils[0])
                                }
                                Button {
                                    var pens = std.pencils
                                    pens[0] = "black"
                                    studentManager.otherEditStudent(id: std.dID, pencils: pens)
                                } label: {
                                    Text("編輯")
                                }
                            }
                        }.onDelete { index in
                            studentManager.removeStudent(id: studentManager.students[index.first ?? 0].dID)
                        }.onSubmit {
                            
                        }
                        
                    }
                    .navigationTitle("Students")
                    .navigationBarItems(trailing: Button(action: {
                        showPopup.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    }))
                    .sheet(isPresented: $showPopup) {
                        NewStudent(showPopup: $showPopup)
                    }
                }
                */
            }
        }else{
            VStack {
                Text("提示訊息\n\(message)")
                    .frame(width: 300, height: 100)
                    .bold()
                
                TextField("Email", text: $email)
                ZStack(alignment: .trailing) {
                            Group {
                                if isSecured {
                                    SecureField("Password", text: $password)
                                } else {
                                    TextField("Password", text: $password)
                                }
                            }.padding(.trailing, 32)

                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }
                        }
                Button(action: {
                    /*creatAccount(emailValue: email, passwordValue: password)*/
                    login()
                }) {
                    Text("Sign in")
                }
            }
            .padding()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            statusIsLogin = false
        }catch {
        }
    }
    
    func creatAccount(emailValue:String, passwordValue:String){
        Auth.auth().createUser(withEmail: emailValue, password: passwordValue){ reslut, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                message = error?.localizedDescription ?? ""
            }else{
                print(reslut?.debugDescription ?? "")
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                message = error?.localizedDescription ?? ""
            } else {
                print("success")
                statusIsLogin = true
            }
        }
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StudentManager())
    }
}
