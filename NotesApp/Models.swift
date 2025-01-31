//
//  Models.swift
//  NotesApp
//
//  Created by Batch - 2 on 29/01/25.
//

import Foundation

struct Notebook : Equatable, Codable{
    var id : UUID = UUID()
    var name : String
    var description : String = ""
    //var createdDate : Date = Date()
    static func == (lhs: Notebook, rhs: Notebook) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Note{
    var id : UUID = UUID()
    var title : String
    var text : String
    var createdDate : Date = Date()
    var notebook : Notebook
}
