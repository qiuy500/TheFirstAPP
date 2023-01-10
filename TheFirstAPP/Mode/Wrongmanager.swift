//
//  Wrongmanager.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2023/1/10.
//

import SwiftUI
import Firebase

class Wrongmanager : ObservableObject{
    @Published var wrongInformation :[Wrongquestiontitle] = []
    init(){
        fetechInformation()
    }
    func fetechInformation(){ //Read
        
      // Wrongquestiontitle.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("TitleInformations")
        
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
                    let Information = data["Information"] as? String ?? ""
                    
                    let Wrongquestiontitle = Wrongquestiontitle(id: id,dID: dID, Information: Information)
                    
                  //  self.Wrongquestiontitle.append(Wrongquestiontitle)
                }
            }
        }
    }
    func addInformation(Information:String){ //Create
        let db = Firestore.firestore()
        let ref = db.collection("TitleInformations").document()
        
        ref.setData(["Information":Information,"id":UUID().uuidString]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetechInformation()
    }
}
