//
//  SubjectVM.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import Foundation
import CodeScanner
import Firebase

class SubjectVM:ObservableObject{
    
    
    @Published var name: String = ""
    @Published var qrCode: String = ""
    @Published var isShowingScanner = false
    
    
    @Published var isShowAlert = false
    @Published var isCompeleted = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""

    
    var ref: DatabaseReference! = Database.database().reference()

    
    
    func saveUserInDataBase(){
        
        guard qrCode != nil else {
            
            self.isShowAlert = true
            self.alertTitle = "Error !!!"
            self.alertMessage = "Please add QR code!!!"
            return
        }
        guard qrCode != "" else{
            
            self.isShowAlert = true
            self.alertTitle = "Success !!!"
            self.alertMessage = "Please add QR code!!!"
            return
        }
        
        print(Auth.auth().currentUser?.uid)
        var userId = Auth.auth().currentUser?.uid ?? ""
        ref.child("Subjects").child(userId).child(name).setValue(["name":name,"qr":qrCode])
        
        self.isShowAlert = true
        self.alertTitle = "Success !!!"
        self.alertMessage = "Successfully Added !!!"
        name = ""
        qrCode = ""
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            print(details)
            print(result)
            //self.dataClean()
            qrCode = details[0]
            guard details.count == 2 else { return }
            
            print(details)
            print(result)
            
        case .failure(let error):
            print("Scanning failed")
        }
        
        // more code to come
    }
}


