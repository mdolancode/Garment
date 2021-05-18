//
//  Dependencies.swift
//  Matthew-Dolan-lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-18.
//

import UIKit

class Dependencies: HasDatabase, HasGarmentData, HasApplication {
    let database: DatabaseLayer
    let garmentData: GarmentData
    let application: UIApplication

    init(database: DatabaseLayer? = nil,
         garmentData: GarmentData? = nil,
         application: UIApplication?) {
        let garment = garmentData ?? GarmentData()
        self.database = database ?? DatabaseLayer()
        self.garmentData = garment
        self.application = application ?? UIApplication.shared
    }
}

protocol HasDatabase {
    var database: DatabaseLayer { get }
}

protocol HasGarmentData {
    var garmentData: GarmentData { get }
}

protocol HasApplication {
    var application: UIApplication { get }
}

