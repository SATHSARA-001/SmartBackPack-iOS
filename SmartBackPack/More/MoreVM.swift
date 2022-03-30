//
//  MoreVM.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import Foundation
import Firebase

class MoreVM:ObservableObject{
    
    func logOutCurrentUser(completion: @escaping (_ status: Bool) -> ()){
        
        do {
            try Auth.auth().signOut()
            completion(true)
            
        } catch {
            print("The file could not be loaded")
            completion(false)
        }
        
    }
}
