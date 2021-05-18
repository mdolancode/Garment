//
//  AddViewController.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-15.
//

import UIKit
import RealmSwift

class AddGarmentViewController: UIViewController {
    
    let realm = try! Realm()
//    let dependencies: Dependencies? = nil
    var delegate: AddGarmentDelegate?
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var garmentNameLabel: UILabel!
    @IBOutlet weak var addGarmentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUI()
        textFieldUI()
        garmentLabelUI()
    }
    
    //MARK: - NavigationBarUI
    
    func navigationBarUI() {
        navigationBar.barTintColor = .white
        navigationBar.topItem?.title = "Add"
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
        saveBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 18)!], for: .normal)
        
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationBar.layer.shadowOpacity = 1.0
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationBar.layer.shadowRadius = 0.1
    }
    
    //MARK: - GarmentLabelUI
    
    func garmentLabelUI() {
        garmentNameLabel.font = UIFont(name: "MarkerFelt-Thin", size: 24)
        garmentNameLabel.text = "Garment Name:"
    }
    
    //MARK: - UITextField
    
    func textFieldUI() {
        addGarmentTextField.clearButtonMode = .whileEditing
        addGarmentTextField.layer.borderWidth = 1
        addGarmentTextField.layer.borderColor = UIColor.black.cgColor
        addGarmentTextField.font = UIFont(name: "MarkerFelt-Thin", size: 16)
    }
    
    //MARK: - Save Button
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let garmentName = addGarmentTextField.text, addGarmentTextField.hasText else {
            print("Error adding garment.")
            return
        }
        
        let dateCreated = Date()
        let garmentData = GarmentData(garmentName: garmentName, dateCreated: dateCreated)
        
        delegate?.addGarment(garmentData)
        
        do {
            try self.realm.write {
                self.realm.add(garmentData)
            }
        } catch {
            print("Error saving garment\(error)")
        }
        
//        if dependencies?.database.save(garment: garmentData) != nil {
//            //            sendData(garmentData)
//        }
    }
    
    //MARK: - Send to AddGarmentDelegate
    //
    //    func sendToDelegate(garmentName: String, dateCreated: String) {
    //        let garment = GarmentData(garmentName: garmentName, dateCreated: dateCreated)
    //        delegate?.addGarment(garment)
    //    }
    
    //MARK: - Get Textfield Input
//
//    func getGarmentName() -> String? {
//        let garmentName = addGarmentTextField.text
//        if garmentName == addGarmentTextField.text, addGarmentTextField.hasText {
//            return garmentName
//        }
//        return garmentName
//    }
    
    //MARK: - Get Date
    //    func getDate() -> String {
    //        // Gets the current date and time.
    //        let currentDateTime = Date()
    //
    //        // Initializes the date formatter and set the style.
    //        let formatter = DateFormatter()
    //        formatter.timeStyle = .medium
    //        formatter.dateStyle = .long
    //
    //        // Gets the date and time String from the date object.
    //        let dateCreated = formatter.string(from: currentDateTime)
    //
    //        return dateCreated
    //    }
}

//        func sendToDelegateWriteToRealm() {
//            guard let garmentName = addGarmentTextField.text, addGarmentTextField.hasText else {
//                print("Error adding garment.")
//                return
//            }
//
//
//            let garment = GarmentData(garmentName: garmentName, dateCreated: dateCreated)
//            delegate?.addGarment(garment)
//
//            do {
//                try self.realm.write {
//                    self.realm.add(garment)
//                }
//            } catch {
//                print("Error saving garment\(error)")
//            }
//        }
