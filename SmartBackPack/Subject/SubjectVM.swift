//
//  SubjectVM.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import Foundation
import Firebase

class SubjectVM:ObservableObject{
    
    
    @Published var name: String = ""
    @Published var qrCode: String = ""
    
    var ref: DatabaseReference! = Database.database().reference()

    
    
    func saveUserInDataBase(){
        ref.child("Subjects").child(name).setValue(["name":name,"qr":name])
    }
}


