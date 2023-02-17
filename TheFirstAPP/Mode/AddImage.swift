//
//  AddImage.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2023/1/2.
//


/*
 //載入圖片第一種方式
 
 import SwiftUI
 import Firebase
 import FirebaseStorage
 import Combine
 
 extension UIImage {
 func aspectFittedToHeight(to Height: CGFloat) -> UIImage {
 let muti = Height / self.size.height
 let mWidth =  self.size.width * muti
 let size = CGSize(width: mWidth, height: Height)
 return UIGraphicsImageRenderer(size: size).image { _ in
 draw(in: CGRect(origin: .zero, size: size))
 }
 }
 }
 
 class AddImage: ObservableObject {
 
 @Published var myPics:[String] = []
 
 let storage = Storage.storage()
 
 
 
 //FireStorage
 
 func upload(image: UIImage,name: String) async {
 //存放在storage的路徑
 let storageRef = storage.reference().child("\(Auth.auth().currentUser?.uid.description ?? "image")/\(name).jpg")
 
 //針對圖片做縮圖和轉化成jpeg的處理
 let resizedImage = image.aspectFittedToHeight(to: 200)
 let data = resizedImage.jpegData(compressionQuality: 0.2)
 
 let metadata = StorageMetadata() //設定要上傳到storage的檔案類型
 metadata.contentType = "image/jpg"
 
 //上傳
 if let data = data {
 storageRef.putData(data, metadata: metadata) { (metadata, error) in
 if let error = error {
 print("Error while uploading file: ", error)
 }
 
 if let metadata = metadata {
 print("Metadata: ", metadata)
 }
 }
 }
 }
 
 func listAllFiles(){
 myPics.removeAll()
 // Create a reference
 let storageRef = storage.reference().child("\(Auth.auth().currentUser?.uid.description ?? "image")")
 
 // List all items in the images folder
 storageRef.listAll { (result, error) in
 if let error = error {
 print("Error while listing all files: ", error)
 }
 
 for item in result!.items {
 item.downloadURL { url, err in
 if err != nil {
 print("err")
 }
 
 self.myPics.append(url?.absoluteString ?? "")
 }
 
 print("Item in images folder: ", item)
 }
 }
 }
 
 func deleteItem(url: String) {
 storage.reference(forURL: url).delete { error in
 if let error = error {
 print("Error deleting item", error)
 }
 self.listAllFiles()
 }
 }
 
 //FireBase CRUD
 
 }
 class FImageLoader: ObservableObject {
 
 var didChange = PassthroughSubject<Data, Never>()
 var data = Data() {
 didSet {
 didChange.send(data)
 }
 }
 
 init(urlString:String) {
 guard let url = URL(string: urlString) else { return }
 let task = URLSession.shared.dataTask(with: url) { data, response, error in
 guard let data = data else { return }
 DispatchQueue.main.async {
 self.data = data
 }
 }
 task.resume()
 }
 }
 */
import SwiftUI
import Firebase
import FirebaseStorage
import Combine

extension UIImage {
    func aspectFittedToHeight(to Height: CGFloat) -> UIImage {
        let muti = Height / self.size.height
        let mWidth =  self.size.width * muti
        let size = CGSize(width: mWidth, height: Height)
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

class AddImage: ObservableObject {
    @Published var students:[Student] = []
    @Published var myPics:[String] = []
    
    let storage = Storage.storage()
    
    init(){
        fetechStudents()
    }
    
    //FireStorage
    
    func upload(image: UIImage,name: String) async {
        //存放在storage的路徑
        let storageRef = storage.reference().child("\(Auth.auth().currentUser?.uid.description ?? "image")/\(name).jpg")
        
        //針對圖片做縮圖和轉化成jpeg的處理
        let resizedImage = image.aspectFittedToHeight(to: 200)
        let data = resizedImage.jpegData(compressionQuality: 0.2)
        
        let metadata = StorageMetadata() //設定要上傳到storage的檔案類型
        metadata.contentType = "image/jpg"
        
        //上傳
        if let data = data {
            storageRef.putData(data, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print("Error while uploading file: ", error)
                }
                
                if let metadata = metadata {
                    print("Metadata: ", metadata)
                }
            }
        }
    }
    
    func listAllFiles(){
        myPics.removeAll()
        // Create a reference
        let storageRef = storage.reference().child("\(Auth.auth().currentUser?.uid.description ?? "image")")
        
        // List all items in the images folder
        storageRef.listAll { (result, error) in
            if let error = error {
                print("Error while listing all files: ", error)
            } else if let result = result {
                for item in result.items {
                    item.downloadURL { url, err in
                        if err != nil {
                            print("err")
                        }
                        
                        self.myPics.append(url?.absoluteString ?? "")
                    }
                    
                    print("Item in images folder: ", item)
                }
            }
        }
    }
    
    
    func deleteItem(url: String) {
        storage.reference(forURL: url).delete { error in
            if let error = error {
                print("Error deleting item", error)
            }
            self.listAllFiles()
        }
    }
    
    //FireBase CRUD
    
    func fetechStudents(){ //Read
        
        students.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Student")
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    
                    let dID = document.documentID
                    
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let pencils = data["pencils"] as? [String] ?? ["black"]
                    
                    let student = Student(id: id,name: name, dID: dID, pencils: pencils)
                    
                    self.students.append(student)
                }
            }
        }
    }
    /*
    func addStudent(name:String){ //Create
        let db = Firestore.firestore()
        let ref = db.collection("Student").document()
        
        ref.setData(["name":name,"id":UUID().uuidString]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetechStudents()
    }
    
    func editStudent(id:String,name:String){ //Update
        let db = Firestore.firestore()
        let ref = db.collection("Student").document(id)
        
        ref.updateData(["name":name]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetechStudents()
    }
    
    
    func otherEditStudent(id:String,pencils:[String]){ //Update
        let db = Firestore.firestore()
        let ref = db.collection("Student").document(id)
        
        do{
            ref.updateData(["pencils":pencils]) { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }catch{
            print("")
        }
        
        fetechStudents()
    }
    
    func removeStudent(id:String){ //Delete
        let db = Firestore.firestore()
        db.collection("Student").document(id).delete()
        fetechStudents()
    }
    
    func findStudent(name:String){ //Search
        
        students.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Student")
        
        ref.whereField("name", isEqualTo: name).getDocuments(){ snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for ducument in snapshot.documents {
                    let data = ducument.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let dID = data["dID"] as? String ?? ""
                    let pencils = data["pencils"] as? [String] ?? ["black"]
                    
                    
                    let student = Student(id: id,name: name, dID: dID, pencils: pencils)
                    
                    self.students.append(student)
                }
            }
        }
    }*/
}

//載入圖片第一種方式
class FImageLoader: ObservableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
