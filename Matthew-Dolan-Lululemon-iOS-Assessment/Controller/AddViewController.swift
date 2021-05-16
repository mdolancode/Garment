//
//  AddViewController.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-15.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var garmentNameLabel: UILabel!
    @IBOutlet weak var addGarmentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUI()
        garmentNameLabel.font = UIFont(name: "MarkerFelt-Thin", size: 24)
        saveBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 18)!], for: .normal)
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - NavigationBarUI
    
    func navigationBarUI() {
        navigationBar.barTintColor = .white
        // TODO: Add Title here and take it out of Attributes inspector
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
    }
}
