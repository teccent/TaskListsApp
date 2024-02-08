//
//  TaskList.swift
//  TaskListsApp
//
//  Created by Теона Магай on 07.02.2024.
//

import RealmSwift
import Foundation

class TaskList: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    let tasks = List<Task>()
}

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = false
}
