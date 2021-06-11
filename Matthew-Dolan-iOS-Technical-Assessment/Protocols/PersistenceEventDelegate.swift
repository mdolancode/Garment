//
//  PersistenceEventDelegate.swift
//  Matthew-Dolan-iOS-Technical-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-18.
//

import Foundation

protocol PersistenceEventDelegate: AnyObject {
    func didSaveData()
}
