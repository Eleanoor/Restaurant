//  Minor Ptogrammeren, AppStudio
//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Eleanoor Polder on 09-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    // MARK: - Variables
    var minutes: Int!
    
    // MARK: - Outlets
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
    
}


