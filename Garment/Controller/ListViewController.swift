//
//  ListViewController.swift
//  Garment
//
//  Created by Matt Dolan External macOS on 2021-05-14.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {
    
    var dependencies = Dependencies.shared
    var garments: Results<GarmentData>?
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var alphaButton: UIButton!
    @IBOutlet weak var creationTimeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUI()
        buttonUI()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadGarmentData()
    }
    
    //MARK: - NavigationBarUI
    
    func navigationBarUI() {
        navigationBar.barTintColor = .white
        
        navigationBar.topItem?.title = "List"
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
        addBarButtonItem.tintColor = .black
        
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationBar.layer.shadowOpacity = 1.0
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationBar.layer.shadowRadius = 0.1
    }
    
    //MARK: - ButtonUI
    
    func buttonUI() {
        // alphaButton
        alphaButton.backgroundColor = .white
        alphaButton.layer.borderColor = UIColor.black.cgColor
        alphaButton.layer.borderWidth = 1
        alphaButton.layer.cornerRadius = 10
        alphaButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        alphaButton.setTitle("Alpha", for: .normal)
        alphaButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        alphaButton.setTitleColor(.black, for: .normal)
        
        // creationTimeButton
        creationTimeButton.backgroundColor = .white
        creationTimeButton.layer.borderColor = UIColor.black.cgColor
        creationTimeButton.layer.borderWidth = 1
        creationTimeButton.layer.cornerRadius = 10
        creationTimeButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        creationTimeButton.setTitle("Creation Time", for: .normal)
        creationTimeButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        creationTimeButton.setTitleColor(.black, for: .normal)
        
    }
    
    //MARK: - HeaderAndFooter
    
    private func headerView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 2))
        view.backgroundColor = .black
        
        return view
    }
    
    private func footerView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 2))
        view.backgroundColor = .black
        
        return view
    }
    
    //MARK: - LoadGarmentData
    
    func loadGarmentData() {
        garments = dependencies.database.loadDataByDateCreated()
        tableView.reloadData()
    }
    
    //MARK: - NavigateToAddGarmentViewController
    
    @IBAction func addBarButtonItemPressed(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(identifier: "AddGarmentViewController") as? AddGarmentViewController else {
            print("Failed to get vc from storyboard")
            return
        }
        
        vc.delegate = self
        present(vc, animated: true)
    }
    
    //MARK: - SortAlphabeticalOrder
    
    @IBAction func alphaButtonPressed(_ sender: UIButton) {
        garments = dependencies.database.loadDataByAlphabeticalOrder()
        tableView.reloadData()
    }
    
    
    //MARK: - SortByCreationTime
    
    @IBAction func creationTimeButtonPressed(_ sender: UIButton) {
        garments = dependencies.database.loadDataByDateCreated()
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.headerView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.footerView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = garments?.count, count > 0 else {
            return 1
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        
        if let count = garments?.count,
           count == 0 {
            cell.textLabel?.text = "No garments added yet."
        } else {
            cell.textLabel?.text = garments?[indexPath.row].garmentName
        }
        
        cell.textLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - PersistenceEventDelegate

extension ListViewController: PersistenceEventDelegate {
    func didSaveData() {
        self.dismiss(animated: true) {
            self.tableView.reloadData()
        }
    }
}

