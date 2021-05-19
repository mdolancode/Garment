//
//  Dependencies.swift
//  Matthew-Dolan-lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-18.
//

import Foundation

class Dependencies {
    
    static let shared = Dependencies()
    
    var database: DatabaseLayer

    private init(database: DatabaseLayer = DatabaseLayer()) {
        self.database = database
    }
}
