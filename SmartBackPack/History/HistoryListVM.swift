//
//  HistoryListVM.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 31/3/2022.
//

import Foundation
import Firebase



class HistoryListVM:ObservableObject{
    
    var mondayHistory:[History] = []
    var hasTimeElapsed = false
    var dates = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    
    func delay(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8){
            self.hasTimeElapsed = true
        }
        
    }
    
  
    func fetchHistory(){
        
        let uid = Auth.auth().currentUser?.uid ?? ""

        let dbRef = Database.database().reference().child("History").child("6OUpG4WZXiVSloYCCKAklNsuaJg1").child("Monday")
        
        dbRef.observe(DataEventType.value) { (snapshot) in
            print(snapshot)
            if snapshot.childrenCount > 0{
                
                self.mondayHistory.removeAll()
                
                for days in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let bookObjectData = days.value as? [String: AnyObject]
                    
                    let day  = bookObjectData?["day"]
                    let name = bookObjectData?["name"]
                    
                    let bookObject = History(name: name as? String, day: day as? String)
                    
                    self.mondayHistory.append(bookObject)

                    print(self.mondayHistory.count)
                }
                                
            }
        }
        
    }
    
}
