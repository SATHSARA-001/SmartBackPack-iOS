//
//  Booking.swift
//  NIBMParking
//
//  Created by Shanuri Vimansa on 2021-11-17.
//

import Foundation


struct History: Codable {
    
    var name: String?
    var day:String?

    public init(name:String?,day:String?) {
        
        self.name = name
        self.day = day
        
    }
    
    public enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case day = "day"
        
    }
    
    
}
