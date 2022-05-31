//
//  HistoryListVM.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 31/3/2022.
//

import Foundation
import Firebase



class HistoryListVM:ObservableObject{
    
    @Published var mondayHistory:[History] = []
    @Published var tuesdayHistory:[History] = []
    @Published var wednesdayHistory:[History] = []
    @Published var thursdayHistory:[History] = []
    @Published var fridayHistory:[History] = []
    
    var hasTimeElapsed = false
    var dates = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    
    
    
    func fetchHistory(completion: @escaping (_ status: Bool) -> ()){
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        
        
        for dayString in dates {
            let dbRef = Database.database().reference().child("History").child(uid).child(dayString )
            
            
            dbRef.observe(DataEventType.value) { (snapshot) in
                print(snapshot)
                
                if snapshot.childrenCount > 0{
                    
                    if dayString == "Monday"{
                        
                        self.mondayHistory.removeAll()
                        
                        for days in snapshot.children.allObjects as! [DataSnapshot]{
                            
                            let bookObjectData = days.value as? [String: AnyObject]
                            
                            let day  = bookObjectData?["day"]
                            let name = bookObjectData?["name"]
                            
                            let bookObject = History(name: name as? String, day: day as? String)
                            
                            self.mondayHistory.append(bookObject)
                            
                            print(self.mondayHistory.count)
                            
                            completion(true)
                            
                        }
                        
                    }else if dayString == "Tuesday"{
                        
                        self.tuesdayHistory.removeAll()
                        
                        for days in snapshot.children.allObjects as! [DataSnapshot]{
                            
                            let bookObjectData = days.value as? [String: AnyObject]
                            
                            let day  = bookObjectData?["day"]
                            let name = bookObjectData?["name"]
                            
                            let bookObject = History(name: name as? String, day: day as? String)
                            
                            self.tuesdayHistory.append(bookObject)
                            
                            print(self.tuesdayHistory.count)
                            
                            completion(true)
                            
                        }
                        
                        
                    }else if dayString == "Wednesday"{
                        
                        self.wednesdayHistory.removeAll()
                        for days in snapshot.children.allObjects as! [DataSnapshot]{
                            
                            let bookObjectData = days.value as? [String: AnyObject]
                            
                            let day  = bookObjectData?["day"]
                            let name = bookObjectData?["name"]
                            
                            let bookObject = History(name: name as? String, day: day as? String)
                            
                            self.wednesdayHistory.append(bookObject)
                            
                            print(self.wednesdayHistory.count)
                            
                            completion(true)
                            
                        }
                        
                        
                    }else if dayString == "Thursday"{
                        
                        self.thursdayHistory.removeAll()
                        for days in snapshot.children.allObjects as! [DataSnapshot]{
                            
                            let bookObjectData = days.value as? [String: AnyObject]
                            
                            let day  = bookObjectData?["day"]
                            let name = bookObjectData?["name"]
                            
                            let bookObject = History(name: name as? String, day: day as? String)
                            
                            self.thursdayHistory.append(bookObject)
                            
                            print(self.thursdayHistory.count)
                            
                            completion(true)
                            
                        }
                        
                        
                    }else if dayString == "Friday"{
                        
                        self.fridayHistory.removeAll()
                        for days in snapshot.children.allObjects as! [DataSnapshot]{
                            
                            let bookObjectData = days.value as? [String: AnyObject]
                            
                            let day  = bookObjectData?["day"]
                            let name = bookObjectData?["name"]
                            
                            let bookObject = History(name: name as? String, day: day as? String)
                            
                            self.fridayHistory.append(bookObject)
                            
                            print(self.fridayHistory.count)
                            
                            completion(true)
                            
                        }
                        
                    }
            
                }
            }
        }
        
    }
    
}
