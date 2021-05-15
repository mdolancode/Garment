//
//  ListViewController.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-14.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var alphaButton: UIButton!
    @IBOutlet weak var creationTimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUI()
    }
    
    @IBAction func addBarButtonItemPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func alphaButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func creationTimeButtonPressed(_ sender: UIButton) {
    }
    
    func buttonUI() {
        // alphaButton
        alphaButton.backgroundColor = .red
        alphaButton.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
        
        // creationTimButton
        creationTimeButton.backgroundColor = .black
        creationTimeButton.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
        
    }
}

extension UIButton {
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}

