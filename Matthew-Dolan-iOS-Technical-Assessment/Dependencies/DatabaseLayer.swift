//
//  DatabaseLayer.swift
//  Matthew-Dolan-iOS-Technical-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-17.
//

import UIKit
import RealmSwift

class DatabaseLayer {
    
    let realm = try! Realm()
    
    //MARK: - SaveDataToRealm
    
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
    
    //MARK: - LoadData
    
    func loadDataByAlphabeticalOrder() -> Results<GarmentData> {
        realm.objects(GarmentData.self).sorted(byKeyPath: "garmentName", ascending: true)
    }
    
    func loadDataByDateCreated() -> Results<GarmentData> {
        realm.objects(GarmentData.self).sorted(byKeyPath: "dateCreated", ascending: true)
    }
}

//MARK: - MockDatabaseLayer

class MockDatabaseLayer: DatabaseLayer {
    var savesSuccessfully: Bool = false
    
    override func saveData(garment: GarmentData) -> Bool {
        savesSuccessfully
    }
}


