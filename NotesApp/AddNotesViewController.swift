//
//  AddNotesViewController.swift
//  NotesApp
//
//  Created by Batch - 2 on 29/01/25.
//

import UIKit

class AddNotesViewController: UIViewController {

    @IBOutlet weak var addNotesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
