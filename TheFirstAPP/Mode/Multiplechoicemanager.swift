//
//  Multiplechoicemanager.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/13.
//

import SwiftUI
import Firebase
import FirebaseStorage

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
                    let dID = ducument.documentID

                    let date = ducument.data()
                    
                    let id = date["id"] as? String ?? ""
                    let CH1 = date["CH1"] as? String ?? ""
                    let CH2 = date["CH2"] as? String ?? ""
                    let CH3 = date["CH3"] as? String ?? ""
                    let CH4 = date["CH4"] as? String ?? ""
                    let CH5 = date["CH5"] as? String ?? ""
                    let CHTitle = date["CHTitle"] as? String ?? ""
                    let Information = Multiplechoicesetting(id: id, dID: dID,CH1: CH1,CH2: CH2,CH3: CH3,CH4: CH4,CH5: CH5,CHTitle: CHTitle)
                    
                    self.MIF.append(Information)
                }
            }else{
                print("firebase is  down")

            }


        }
    }
    func removeChoiceE(id:String){ //Delete
        let db = Firestore.firestore()
        db.collection("CH5").document(id).delete()
        fetechMultiplechoice()
    }

}
