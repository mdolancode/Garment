//
//  Dependencies.swift
//  Matthew-Dolan-lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-18.
//

import UIKit

class Dependencies: HasDatabase, HasGarmentData, HasApplication {
    let database: DatabaseType
    let garmentData: GarmentData
    let application: UIApplication
    
    init(database: DatabaseType? = nil,
         garmentData: GarmentData? = nil,
         application: UIApplication) {
        let garment = garmentData ?? GarmentData()
        self.database = database ?? DatabaseType()
        self.garmentData = garment
        self.application = application
    }
}

protocol HasDatabase {
    var database: DatabaseType { get }
}

protocol HasGarmentData {
    var garmentData: GarmentData { get }
}

protocol HasApplication {
    var application: UIApplication { get }
}

