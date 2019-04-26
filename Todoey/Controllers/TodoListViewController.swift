//
//  ViewController.swift
//  Todoey
//
//  Created by Andrew Reifel on 4/16/19.
//  Copyright © 2019 Andrew Reifel. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        
        let newItem2 = Item()
        newItem2.title = "Find Rock"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find telsa"
        itemArray.append(newItem3)
        
        
        
        
        // this saves the new todos array for each time the app launches on load
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items

        }
        
    }
    
    // Expects int. returns count in itemArray REUSABLE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // setup for returning the itemArray into each cell of the table view. CAN REUSE THIS FOR OTHER APPS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = item.title
        
        
        //Ternary operatior ==>
        // value = condition ? valueIfTrue : ValueIfFalse
        
        // shortened way to set check mark instead of the if else statement
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        // when clicking on table view item in interface this will stop showing the grey after selecting
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
        
    }

    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UI Alert
            
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
            
            // save new todo to userdefaults which allows to save data for persistance
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            //need this to reload the tableview after appending item! 
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text!)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
   
    
    
    
}

