//
//  ViewController.swift
//  Todoey
//
//  Created by Andrew Reifel on 4/16/19.
//  Copyright © 2019 Andrew Reifel. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   let itemArray = ["Study CS", "Get iOS Job", "Start Business"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Expects int. returns count in itemArray REUSABLE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // setup for returning the itemArray into each cell of the table view. CAN REUSE THIS FOR OTHER APPS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // print(itemArray[indexPath.row])
        
        
        
        // if item in array is selected then add checkmark else remove
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        // when clicking on table view item in interface this will stop showing the grey after selecting
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }


}
