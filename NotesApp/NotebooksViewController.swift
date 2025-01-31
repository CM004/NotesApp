//
//  ViewController.swift
//  NotesApp
//
//  Created by Batch - 2 on 29/01/25.
//
import Foundation
import UIKit

class NotebooksViewController: UIViewController {
    var dataController : DataController?
    @IBOutlet weak var notebooksTableView: UITableView!
    var notebooks: [Notebook] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //populate the notebooks array using the data controller
        if let dataController{
            Task{
                do{
                    self.notebooks = try await dataController.getAllNotebooks()
                    print("\(self.notebooks)")
                    DispatchQueue.main.async{
                        self.notebooksTableView.reloadData()
                    }
                    
                } catch{
                    print("\(error.localizedDescription)")
                }
            }
        }
        notebooksTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let notesVC = segue.destination as? NotesViewController{
            //send the data controller to the destination vc
            ///notesVC.dataController = dataController
            if let selectedIndexPath = notebooksTableView.indexPathForSelectedRow{
                notesVC.selectedNotebook = notebooks[selectedIndexPath.row]
            }
            //notesVC.selectedNotebook = sender as? Notebook
        }
    }
    
    
}

extension NotebooksViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notebooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notebook_cell", for: indexPath)
        
        let notebook = notebooks[indexPath.row]
        
        cell.textLabel?.text = notebook.name
        cell.detailTextLabel?.text = notebook.description
        return cell
    }
    
    
}

//#Preview{
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    
//    let vc = storyboard.instantiateViewController(withIdentifier: "notebooksviewcontroller") as! NotebooksViewController
//    let dataController = DataController()
//    vc.notebooks = dataController.getAllNotebooks()
//    
//     vc
//}
