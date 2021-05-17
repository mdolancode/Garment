//
//  Garment.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-17.
//

import UIKit

protocol AddGarmentDelegate {
    func addGarment(_ garment: Garment)
}

struct Garment {
    var garmentName: String
}
