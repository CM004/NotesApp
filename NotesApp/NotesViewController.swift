//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Batch - 2 on 29/01/25.
//
import Foundation
import UIKit

class NotesViewController: UIViewController {
    var dataController : SampleDataController?
    @IBOutlet weak var notesTableView: UITableView!
    var notes : [Note] = []
    var selectedNotebook : Notebook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dataController, let selectedNotebook{
            notes = dataController.getNotes(for: selectedNotebook)
        }
        notesTableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
}
extension NotesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note_cell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.text
        return cell
    }
}

//#Preview {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "notes_vc") as! NotesViewController
//    let dataController = DataController()
//    vc.notes = dataController.getAllNotes()
//    return vc
//    
//}
