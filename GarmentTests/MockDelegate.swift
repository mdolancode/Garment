//
//  MockDelegate.swift
//  Garment
//
//  Created by Matt Dolan External macOS on 2021-05-18.
//

import XCTest
@testable import Garment

class MockDelegate: PersistenceEventDelegate {
    var didSaveDataCalled = false
    func didSaveData() {
        didSaveDataCalled = true
    }
}
