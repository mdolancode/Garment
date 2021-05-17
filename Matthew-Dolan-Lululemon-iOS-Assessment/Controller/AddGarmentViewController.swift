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
        // TODO: Add Title here and take it out of Attributes inspector
//        navigationItem.title = "Add"
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
        saveBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 18)!], for: .normal)
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
        sendToDelegateWriteToRealm()
    }
    
    //MARK: - Send To AddGarmentDelegate And Write To Realm
    
    func sendToDelegateWriteToRealm() {
        guard let garmentName = addGarmentTextField.text, addGarmentTextField.hasText else {
            print("Error adding garment.")
            return
        }
        
        let garment = GarmentData(garmentName: garmentName)
        delegate?.addGarment(garment)
        
        do {
            try self.realm.write {
                self.realm.add(garment)
            }
        } catch {
            print("Error saving garment\(error)")
        }
    }
}
