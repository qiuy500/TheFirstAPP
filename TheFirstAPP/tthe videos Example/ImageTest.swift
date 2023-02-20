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
    //表示相片庫中的一個項目（可以是圖片、視頻或 Live Photo 等）。當用戶選擇一個項目時，它會被賦值給 selectedItem 變量，以便後續處理。
    @State private var selectedPhotoData:Data?
    //用於保存從相片庫中選擇的圖片數據。
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
                            //使用await和async異步編程，其目的是將從相片庫中選擇的圖片上傳到 Firebase雲端存儲服務中。具體來說，程式碼中的await 用於異步等待讀取圖片數據，並將讀取到的數據轉換為UIImage 對象，然後再將該對象作為參數調用studentManager對象的upload 方法進行上傳。這個upload方法使用Firebase的相關API 實現圖片的上傳操作，其中第一個參數是UIImage對象，第二個參數是檔名，這裡檔名使用當前時間的描述來命名。
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

