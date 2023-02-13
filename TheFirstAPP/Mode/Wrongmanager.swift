//
//  Wrongmanager.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2023/1/10.
//
import SwiftUI
import Firebase
import FirebaseStorage
import Combine
class Wrongmanager: ObservableObject {
    @Published var students:[Student] = []
    @Published var myPics:[String] = []
    @Published var name = ""
    
    let storage = Storage.storage()
    
    init(){
        fetechStudents()
    }
    func fetechStudents(){ //Read
        
        students.removeAll()
        print("fetechStudents")
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
    
    func setName(index:Int){
        name = students[index].name
    }
    
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
    }
}


