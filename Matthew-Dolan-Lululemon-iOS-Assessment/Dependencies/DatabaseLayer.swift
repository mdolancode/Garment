//
//  DatabaseLayer.swift
//  Matthew-Dolan-lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-17.
//

import UIKit
import RealmSwift

class DatabaseLayer {
    
    let realm = try! Realm()
    
    //MARK: - Save To Realm
    
    func saveData(garment: GarmentData) -> Bool {
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
    
    func loadDataByAlphabeticalOrder() -> Results<GarmentData> {
        realm.objects(GarmentData.self).sorted(byKeyPath: "garmentName", ascending: true)
    }
    
    func loadDataByDateCreated() -> Results<GarmentData> {
        realm.objects(GarmentData.self).sorted(byKeyPath: "dateCreated", ascending: true)
    }
}

class MockDatabaseLayer: DatabaseLayer {
    var savesSuccessfully: Bool = false
    
    override func saveData(garment: GarmentData) -> Bool {
        savesSuccessfully
    }
}


