//
//  Matthew_Dolan_iOS_Technical_AssessmentTests.swift
//  Matthew-Dolan-iOS-Technical-AssessmentTests
//
//  Created by Matt Dolan External macOS on 2021-05-14.
//

import UIKit
import XCTest
@testable import Matthew_Dolan_iOS_Technical_Assessment

class Matthew_Dolan_iOS_Technical_AssessmentTests: XCTestCase {
    
    let dependencies = Dependencies.shared
    var mockDataBase = MockDatabaseLayer()
    var vc: AddGarmentViewController!
    
    func createNewMocks() {
        mockDataBase = MockDatabaseLayer()
    }
    
    func setMocks() {
        dependencies.database = mockDataBase
    }
    
    func setUpVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "AddGarmentViewController") as? AddGarmentViewController
        XCTAssertNotNil(vc)
        vc.loadViewIfNeeded()
    }
    
    override func setUpWithError() throws {
        createNewMocks()
        setMocks()
    }
    
    override func tearDownWithError() throws {
        vc = nil
    }
    
    //MARK: - TestDelegateCalledWhenSaveSuccessful
    
    func testDelegateCalledWhenSaveSuccessful() throws {
        // Given the Data is saved Successfully
        // When button Tapped
        // Then Delegate is Called
        let mockDelegate = MockDelegate()
        mockDataBase.savesSuccessfully = true
        setUpVC()
        vc.delegate = mockDelegate
        vc.addGarmentTextField.text = "test text"
        vc.viewDidLoad()
        vc.viewWillAppear(false)
        vc.viewDidAppear(false)
        vc.saveButtonPressed(vc.saveBarButtonItem)
        XCTAssert(mockDelegate.didSaveDataCalled)
    }
    
    //MARK: - TestDelegateNotCalledWhenSaveUnsuccessful
    
    func testDelegateNotCalledWhenSaveUnsuccessful() throws {
        // Given the Data is Not saved Successfully
        // When button Tapped
        // Then Delegate is Not Called
        let mockDelegate = MockDelegate()
        mockDataBase.savesSuccessfully = false
        setUpVC()
        vc.delegate = mockDelegate
        vc.addGarmentTextField.text = "test text"
        vc.viewDidLoad()
        vc.viewWillAppear(false)
        vc.viewDidAppear(false)
        vc.saveButtonPressed(vc.saveBarButtonItem)
        XCTAssertFalse(mockDelegate.didSaveDataCalled)
    }
    
    //MARK: - TestDelegateNotCalledWhenTextFieldIsEmpty
    
    func testDelegateNotCalledWhenTextFieldIsEmpty() throws {
            // Given the Textfield is Empty
            // When button Tapped
            // Then Delegate is Not called
            let mockDelegate = MockDelegate()
            mockDataBase.savesSuccessfully = true
            setUpVC()
            vc.delegate = mockDelegate
            vc.addGarmentTextField.text = nil
            vc.viewDidLoad()
            vc.viewWillAppear(false)
            vc.viewDidAppear(false)
            vc.saveButtonPressed(vc.saveBarButtonItem)
            XCTAssertFalse(mockDelegate.didSaveDataCalled)
        }
}
