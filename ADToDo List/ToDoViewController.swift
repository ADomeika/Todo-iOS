//
//  ToDoViewController.swift
//  ADToDo List
//
//  Created by Adomas Domeika on 07/01/2020.
//  Copyright © 2020 Adomas Domeika. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var toDo: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if toDo != nil {
            if toDo!.important {
                if let title = toDo?.title {
                    titleLabel.text = "❗️" + title
                }
            } else {
                titleLabel.text = toDo!.title
            }
            descriptionLabel.text = toDo!.notes
        }
    }
    
    @IBAction func completeToDo(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
                context.delete(toDo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
