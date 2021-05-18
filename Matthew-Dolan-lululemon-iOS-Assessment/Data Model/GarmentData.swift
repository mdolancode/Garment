//
//  Garment.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-17.
//

import UIKit
import RealmSwift

protocol AddGarmentDelegate {
    func addGarment(_ garment: GarmentData)
    func addDateCreated(_ dateCreated: GarmentData)
}

class GarmentData: Object {
    @objc dynamic var garmentName: String = ""
    @objc dynamic var dateCreated: Date?
    
    convenience init(garmentName: String, dateCreated: Date) {
        self.init()
        self.garmentName = garmentName
        self.dateCreated = dateCreated
    }
}
