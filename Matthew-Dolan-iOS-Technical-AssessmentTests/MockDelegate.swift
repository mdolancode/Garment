//
//  MockDelegate.swift
//  Matthew-Dolan-iOS-Technical-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-18.
//

import XCTest
@testable import Matthew_Dolan_iOS_Technical_Assessment

class MockDelegate: PersistenceEventDelegate {
    var didSaveDataCalled = false
    func didSaveData() {
        didSaveDataCalled = true
    }
}
