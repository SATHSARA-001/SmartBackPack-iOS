//
//  SlotModel.swift
//  NIBMParking
//
//  Created by Shanuri Vimansa on 2021-11-17.
//

import Foundation

struct Subject: Codable {
    
    var name: String?
    var qr : String?
    
    public init(name: String?,qr : String?) {
        
        self.name = name
        self.qr = qr
        
    }
    
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case qr = "qr"
        
        
        
    }
    
    
}

