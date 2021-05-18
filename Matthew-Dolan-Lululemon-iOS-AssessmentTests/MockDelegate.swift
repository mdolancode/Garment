////
////  MockDelegate.swift
////  Matthew-Dolan-lululemon-iOS-AssessmentTests
////
////  Created by Matt Dolan External macOS on 2021-05-18.
////
//
//import XCTest
//@testable import Matthew_Dolan_lululemon_iOS_Assessment
//
//class MockDelegate: GarmentData {
//    var garmentData: GarmentData?
//    func sendData(garmentData: GarmentData) {
//        self.garmentData = garmentData
//        
//        let mockDatabaseLayer = MockDatabaseLayer()
//        
//        Dependencies.shared.databaseLayer = mockDatabaseLayer
//        let vc = storyboard?.instantiateViewController(identifier: "AddGarmentViewController") as? AddGarmentViewController
//        let mockDelegate = MockDelegate
//        vc.delegate = mockDelegate
//        vc.saveButtonPressed()
//        
//        XCTestNotNil(mockDelegate.garmnetData)
//    }
//}
