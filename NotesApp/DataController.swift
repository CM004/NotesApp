//
//  DataController.swift
//  NotesApp
//
//  Created by Batch - 2 on 29/01/25.
//



import Supabase

import Foundation

protocol DataController{
    func getAllNotebooks() async throws-> [Notebook]
    func getAllNotes() -> [Note]
    func getNotes(for notebook: Notebook) -> [Note]
    func addNote(note:Note)
    
}

class SupabaseController : DataController {
    
    var supabaseClient : SupabaseClient = SupabaseClient(supabaseURL:URL(string: "https://cvesdldundudvtlavvkd.supabase.co")!,supabaseKey : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN2ZXNkbGR1bmR1ZHZ0bGF2dmtkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgzMTU3OTYsImV4cCI6MjA1Mzg5MTc5Nn0.cuJC10ymqEXISS0eQMmtMm6m6D6x3Q4xmZcgLGGfgMA")
    
    func getAllNotebooks() async throws -> [Notebook] {
        do {
            return try await supabaseClient.from("Notebook").select().execute().value
        } catch{
            print("Unable to fetch data")
            print("\(error.localizedDescription)")
            return []
        }
    }
    
    func getAllNotes() -> [Note] {
        return []
    }
    
    func getNotes(for notebook: Notebook) -> [Note] {
        return []
    }
    
    func addNote(note: Note) {
        return
    }
    
    
    
}

class SampleDataController : DataController {
    private var notebooks : [Notebook] = [Notebook(name: "First Notebook"),
                                          Notebook(name: "Second Notebook"),
                                          Notebook(name: "Third Notebook"),
                                          Notebook(name: "Fourth Notebook"),
                                          Notebook(name: "Fifth Notebook")]
    
    private var notes : [Note] = []
    init(){
        notes = [Note(title: "Note1", text: "This is a note", notebook: self.notebooks[0]),
                 Note(title: "Note2", text: "Happy coding", notebook: self.notebooks[1]),
                 Note(title: "Note3", text: "Today is friday", notebook: self.notebooks[2])]
    }
    func getAllNotebooks() -> [Notebook] {
        return notebooks
    }
    func getAllNotes() -> [Note] {
        return notes
    }
    func getNotes(for notebook: Notebook) -> [Note] {
        notes.filter { $0.notebook == notebook }
    }
    func addNote(note: Note) {
        notes.append(note)
    }
    class RemoteServerController : DataController {
        func addNote(note: Note) {
            
        }
        
        func getAllNotebooks() -> [Notebook] {
            return [Notebook]()
        }
        
        func getAllNotes() -> [Note] {
            return [Note]()
        }
        
        func getNotes(for notebook: Notebook) -> [Note] {
            return [Note]()
        }
    }
    
}


