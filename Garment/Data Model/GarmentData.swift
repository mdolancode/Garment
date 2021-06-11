//
//  Garment.swift
//  Garment
//
//  Created by Matt Dolan External macOS on 2021-05-17.
//

import UIKit
import RealmSwift

class GarmentData: Object {
    
    @objc dynamic var garmentName: String = ""
    @objc dynamic var dateCreated: Date?
    
    convenience init(garmentName: String, dateCreated: Date) {
        self.init()
        self.garmentName = garmentName
        self.dateCreated = dateCreated
    }
}
