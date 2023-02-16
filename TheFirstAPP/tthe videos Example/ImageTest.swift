//
//  ImageTest.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2023/1/9.
//

import SwiftUI
import Firebase
import PhotosUI

@available(iOS 16.0, *)
struct ImageTest: View {
    @EnvironmentObject var studentManager:AddImage
    
    //@EnvironmentObject var tryimage: AsyncImage
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData:Data?
    @State var searchName = ""

    @State var showImg = false
    var body: some View {
        VStack {
            HStack{
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
                            ImageView(withURL: pic)
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
        }

    }
}
struct ImageTest_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            ImageTest().environmentObject(AddImage())
        }
    }
}

