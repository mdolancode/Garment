//
//  MockDelegate.swift
//  Matthew-Dolan-lululemon-iOS-AssessmentTests
//
//  Created by Matt Dolan External macOS on 2021-05-18.
//

import XCTest
@testable import Matthew_Dolan_lululemon_iOS_Assessment

class MockDelegate: PersistenceEventDelegate {
    var didSaveDataCalled = false
    func didSaveData() {
        didSaveDataCalled = true
    }
}
