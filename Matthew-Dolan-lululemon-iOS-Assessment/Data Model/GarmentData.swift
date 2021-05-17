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
}

class GarmentData: Object {
    @objc dynamic var garmentName: String = ""
    
    convenience init(garmentName: String) {
        self.init()
        self.garmentName = garmentName
    }
}
