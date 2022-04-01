//
//  Booking.swift
//  NIBMParking
//
//  Created by Shanuri Vimansa on 2021-11-17.
//

import Foundation


struct History: Codable {
    
    var historyId: String?
    var date : String?
    var availabelBookList:[Subject]?
    
    
    public init(historyId:String?,date: String?,availabelBookList:[Subject]?) {
        
        self.historyId = historyId
        self.date = date
        self.availabelBookList = availabelBookList
        
    }
    
    public enum CodingKeys: String, CodingKey {
        
        case historyId = "historyId"
        case date = "date"
        case availabelBookList = "availabelBookList"
        
    }
    
    
}
