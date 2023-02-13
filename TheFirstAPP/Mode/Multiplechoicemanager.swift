//
//  Multiplechoicemanager.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/13.
//

import SwiftUI
import Firebase

class Multplechoicemanager : ObservableObject {
    @Published var MIF : [Multiplechoicesetting] = []
    
    init(){
        fetechMultiplechoice()
    }
    
    
    func fetechMultiplechoice(){
        MIF.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Multiplechoicesetting")
        
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for ducument in snapshot.documents {
                    let date = ducument.data()
                    
                    let id = date["id"] as? String ?? ""
                    let dID = ducument.documentID
                    let Information = Multiplechoicesetting(id: id, dID: dID)
                    
                    self.MIF.append(Information)
                }
            }
        }
        
        
        
        
    }
}
