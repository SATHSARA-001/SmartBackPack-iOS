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
    @Published var reference = Database.database().reference()

    
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
    
    
    func removeBookFromTimeTable(subjectName:String,day:String,completion: @escaping (_ status: Bool) -> ()){
        
        let userId = Auth.auth().currentUser?.uid ?? ""
        
        let reference = self.reference.child("TimeTable").child(userId).child(day).child(subjectName)
        reference.removeValue { error, _ in
            
            if error != nil{
                print(error?.localizedDescription)
                completion(false)
            }else{
                self.getAllBooks()
                completion(true)
            }
        }
        
    }
    
    func addBookToTimeTable(subject:Subject,day:String,completion: @escaping (_ status: Bool) -> ()){
        
        let userId = Auth.auth().currentUser?.uid ?? ""
        
        let reference = self.reference.child("TimeTable").child(userId).child(day).child(subject.name ?? "")
        
        do{
            let obj = try subject.toDictionary()
            reference.setValue(obj)
            getAllBooks()
        }catch{
            
        }
        
        
        
    }
    
}


//Subject - usedid - bookname


extension Encodable {

    /// Converting object to postable dictionary
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
}
