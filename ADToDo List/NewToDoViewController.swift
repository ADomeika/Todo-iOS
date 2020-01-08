//
//  NewToDoViewController.swift
//  ADToDo List
//
//  Created by Adomas Domeika on 07/01/2020.
//  Copyright © 2020 Adomas Domeika. All rights reserved.
//

import UIKit

class NewToDoViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var importantCheckbox: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addToDo(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDoItem(context: context)
            if let title = titleField.text {
                if let notes = descriptionField.text {
                    let important = importantCheckbox.isOn
                    newToDo.title = title
                    newToDo.notes = notes
                    newToDo.important = important
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
