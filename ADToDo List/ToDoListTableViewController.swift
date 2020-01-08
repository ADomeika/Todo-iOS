//
//  ToDoListTableViewController.swift
//  ADToDo List
//
//  Created by Adomas Domeika on 07/01/2020.
//  Copyright © 2020 Adomas Domeika. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDos: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItems = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                toDos = coreDataToDoItems
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            if let title = toDo.title {
                cell.textLabel?.text = "❗️" + title
            }
        } else {
            cell.textLabel?.text = toDo.title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "goToToDo", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toDoVC = segue.destination as? ToDoViewController {
            if let selectedToDo = sender as? ToDoItem {
                toDoVC.toDo = selectedToDo
            }
        }
    }
}
