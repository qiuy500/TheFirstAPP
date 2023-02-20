//
//  Wrongquestion.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//


import SwiftUI
import Firebase
import PhotosUI

@available(iOS 16.0, *)
struct Wrongquestion: View {
    @EnvironmentObject var Aimage:AddImage

    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData:Data?
    @State var ph:[String] = []
    @State var showImg = false
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName:"square.and.arrow.up")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .padding()
                    Spacer()
                Text("錯題本")
                    .font(.title)
                    .padding(.all)
            
                Spacer()
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Image(systemName:"plus")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .padding()
                    //Label("選擇相片", systemImage: "plus")
                }.onChange(of: selectedItem) { newValue in
                    Task{
                        if let data = try? await newValue?.loadTransferable(type: Data.self){
                            selectedPhotoData = data
                            showImg = true
                            await Aimage.upload(image: UIImage(data: data)!,name: "pictureName\(Date.now.description)")
                        }
                    }
                    
                }
            }
            .frame(alignment: .top)//top
            ZStack{
                Text("")
                    .foregroundColor(.white)
                    .padding(.horizontal,190)
                    .padding(.vertical,15)
                    .background(Color.gray)
                    .font(.title)
                    .cornerRadius(30)
                Text("XX/??")
                    .padding()
                    .foregroundColor(.white)
            }
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
                            Aimage.listAllFiles()
                        } label: {
                            Text("確定")
                        }

                    }
                }
            }
            NavigationView {
                List{
                    ForEach(Aimage.myPics,id:\.self){ pic in
                        HStack {
                            ImageView(withURL: pic)
                            Button {
                                Aimage.deleteItem(url: pic)
                                
                            } label: {
                                Text("刪除")
                            }

                        }
                    }
                }
            }.onAppear{
                Aimage.listAllFiles()
            }
            //top
            /*VStack{
             HStack{
                 Text("原題")
                     .foregroundColor(.white)
                     .padding(.horizontal,80)
                     .padding(.vertical,110)
                     .background(Color.teal)
                     .font(.title)
                     .cornerRadius(10)
                 VStack{ Text("考點")
                         .foregroundColor(.white)
                         .padding(.horizontal,40)
                         .padding(.vertical,20)
                         .background(Color.cyan)
                         .font(.title)
                         .cornerRadius(10)
                     Text("錯題出處")
                             .foregroundColor(.white)
                             .padding(.horizontal,20)
                             .padding(.vertical,85)
                             .background(Color.cyan)
                             .font(.title)
                             .cornerRadius(10)
                 }
             }
                HStack{
                    Text("錯因與正解")
                        .foregroundColor(.white)
                        .padding(.horizontal,40)
                        .padding(.vertical,30)
                        .background(Color.teal)
                        .font(.title)
                        .cornerRadius(10)
                    Text("注意事項")
                        .foregroundColor(.white)
                        .padding(.horizontal,5)
                        .padding(.vertical,30)
                        .background(Color.cyan)
                        .font(.title)
                        .cornerRadius(10)
                    
                }
                Text("備忘錄")
                    .foregroundColor(.white)
                    .padding(.horizontal,140)
                    .padding(.vertical,50)
                    .background(Color.gray)
                    .font(.title)
                    .cornerRadius(15)
            }*/

            }

    }
    }

struct Wrongquestion_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            Wrongquestion().environmentObject(AddImage())
        } else {
            // Fallback on earlier versions
        }
    }
}

