//  Minor Programmeren, AppStudio
//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Eleanoor Polder on 07-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  Table View for categories.

import UIKit

class CategoryTableViewController: UITableViewController {
    
    // MARK: - Variables
    var categories = [String]()

    // MARK: - Functions
    
    /// Function
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuController.shared.fetchCategories { (categories) in
            if let categories = categories {
                self.updateUI(with: categories)
            }
        }
    }
    
    /// Function
    func updateUI(with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }

    /// Function
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    /// Function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    /// Function
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)

        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    /// Function
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let categoryString = categories[indexPath.row]
        cell.textLabel?.text = categoryString.capitalized
    }
    
    /// Function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuSegue" {
            let menuTableViewController = segue.destination as! MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController.category = categories[index]
        }
    }

}
