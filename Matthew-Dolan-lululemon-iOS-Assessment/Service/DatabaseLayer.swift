//
//  DatabaseLayer.swift
//  Matthew-Dolan-lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-17.
//

import UIKit
import RealmSwift

// create dependency class ina seperate class and then call the depenceny in the AddGarmentVC to then be able to save

class DatabaseLayer {
    
    let realm = try! Realm()
    
    //MARK: - Save To Realm
    
    func save(garment: GarmentData) -> Bool {
        do {
            try self.realm.write {
                self.realm.add(garment)
            }
            return true
        } catch {
            print("Error saving garment\(error)")
            return false
        }
    }
}


// When I save this from vc I can check the bool is successful vs unsuccessful
// Write XCTest to check VC Behaviour Use if Statement
// Add label database failed to save


class MockDatabaseLayer: DatabaseLayer {
    var savesSuccessfully: Bool = false
    
    override func save(garment: GarmentData) -> Bool {
        return savesSuccessfully
    }
}


