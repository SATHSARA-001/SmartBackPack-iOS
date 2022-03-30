//
//  ViewBooksVM.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 30/3/2022.
//

import Foundation
import Firebase

class ViewBooksVM:ObservableObject{
    
    @Published var reference = Database.database().reference()
    @Published var bookList = [Subject]()
    
    
    
    func fetchOrders(){
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        
        let dbRef = Database.database().reference().child("Subjects").child(uid)
        
        dbRef.observe(DataEventType.value) { (snapshot) in
            print(snapshot)
            if snapshot.childrenCount > 0{
                self.bookList.removeAll()
                
                for books in snapshot.children.allObjects as! [DataSnapshot]{
                    let bookObjectData = books.value as? [String: AnyObject]
                    
                    let name  = bookObjectData?["name"]
                    let qrCode = bookObjectData?["qr"]
                    
                    let bookObject = Subject(name: name as? String, qr: qrCode as? String)
                    
                    self.bookList.append(bookObject)

                    print(self.bookList.count)
                }
                                
            }
        }
        
    }
    
    
    func deleteRecordBooks(subjectName:String,completion: @escaping (_ status: Bool) -> ()){
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        
        let reference = self.reference.child("Subjects").child(uid).child(subjectName)
        reference.removeValue { error, _ in
            
            if error != nil{
                print(error?.localizedDescription)
                completion(false)
            }else{
                completion(true)
            }
        }
        
    }
}
