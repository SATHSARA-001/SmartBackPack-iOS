//
//  ReservedListVM.swift
//  NIBMParking
//
//  Created by Shanuri Vimansa on 2021-11-21.
//

import Foundation
import Firebase


class ReservedListVM:ObservableObject{
    
    @Published var bookingsAndReservedList = [Booking]()
    
    //MARK: - PROPERTY FOR ALERT
    
    @Published var isShowAlert = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
    
    
    @Published var availabelVehicleNo = ""
    @Published var statusBooked = ""
    @Published var statusReserved = ""
    @Published var reference = Database.database().reference()
    
    
    
    func getSlotData(vehicleNoString:String,completion: @escaping (_ status: Bool) -> ()){
        
        let dbRef = Database.database().reference().child("bookings")
        
        let query = dbRef.queryOrdered(byChild: "vehicleNo").queryEqual(toValue: vehicleNoString)
        query.observe(.value, with: { [self] (snapshot) in
            
            if snapshot.childrenCount > 0{
                self.bookingsAndReservedList.removeAll()
                
                for bookings in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let bookingObject = bookings.value as? [String: AnyObject]
                    
                    let slotId = bookingObject?["slotID"]
                    let regNo = bookingObject?["regNo"]
                    let vehicleNo = bookingObject?["vehicleNo"]
                    let reservedLocationLongitude = bookingObject?["reservedLocationLongitude"]
                    let reservedLocationLatitude = bookingObject?["reservedLocationLatitude"]
                    let reservedTime = bookingObject?["reservedTime"]
                    let bookedTime = bookingObject?["bookedTime"]
                    let isReserved = bookingObject?["isReserved"]
                    let isBooked = bookingObject?["isBooked"]
                    
                    
                    let booking = Booking(slotId: slotId as? String, regNo: regNo as? String, reservedLocationLongitude: reservedLocationLongitude as? String, reservedLocationLatitude: reservedLocationLatitude as? String, reservedTime: reservedTime as? String, bookedTime: bookedTime as? String, vehicleNo: vehicleNo as? String, isBooked: isBooked as? String, isReserved: isReserved as? String)
                    
                    //appending it to list
                    
                    self.bookingsAndReservedList.append(booking)
                    print(self.bookingsAndReservedList)
                    
                    
                }
                
                completion(true)
            }
        })
        
        completion(false)
        
    }
    
    
    
    func deleteRecordBookings(slotId:String,completion: @escaping (_ status: Bool) -> ()){
        
        let reference = self.reference.child("bookings").child(slotId)
        reference.removeValue { error, _ in
            
            if error != nil{
                print(error?.localizedDescription)
                completion(false)
            }else{
                completion(true)
            }
        }
        
    }
    
    
    func updateStatus(slotId:String){
        
        let ref = Database.database().reference().child("bookings").child(slotId)
        
        ref.updateChildValues(["isBooked": "true","bookedTime":getDate()])
        
    }
    
    func getDate()->String{
        let time = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:ss"
        let stringDate = timeFormatter.string(from: time)
        return stringDate
    }
}





//
//for childSnapshot in snapshot.children {
//    print(childSnapshot)
//}
