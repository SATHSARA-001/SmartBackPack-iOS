//
//  AddTimeTableVM.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import Foundation
import Firebase

class AddTimeTableVM:ObservableObject{
    
    @Published var availableBookList = [Subject]()
    @Published var listOfAllBooks = [Subject]()

    
    func getAvailablebooks(day:String){
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        
        let dbRef = Database.database().reference().child("TimeTable").child(uid).child(day)
        
        dbRef.observe(DataEventType.value) { (snapshot) in
            print(snapshot)
            if snapshot.childrenCount > 0{
                self.availableBookList.removeAll()
                
                for books in snapshot.children.allObjects as! [DataSnapshot]{
                    let bookObjectData = books.value as? [String: AnyObject]
                    
                    let name  = bookObjectData?["name"]
                    let qrCode = bookObjectData?["qr"]
                    
                    let bookObject = Subject(name: name as? String, qr: qrCode as? String)
                    
                    self.availableBookList.append(bookObject)

                    print(self.availableBookList.count)
                }
                                
            }
        }
        
    }

    func getAllBooks(){
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        
        let dbRef = Database.database().reference().child("Subjects").child(uid)
        
        dbRef.observe(DataEventType.value) { [self] (snapshot) in
            print(snapshot)
            if snapshot.childrenCount > 0{
                self.listOfAllBooks.removeAll()
                
                for books in snapshot.children.allObjects as! [DataSnapshot]{
                    let bookObjectData = books.value as? [String: AnyObject]
                    
                    let name  = bookObjectData?["name"]
                    let qrCode = bookObjectData?["qr"]
                    
                    let bookObject = Subject(name: name as? String, qr: qrCode as? String)
                    
                    if self.availableBookList.contains(where: {$0.name == bookObject.name}){
                        print("Available")
                    }else{
                        self.listOfAllBooks.append(bookObject)

                    }
                    print(self.listOfAllBooks.count)
                }
                                
            }
        }
        
    }
    
}
