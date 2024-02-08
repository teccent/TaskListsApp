//
//  DataManager.swift
//  TaskListsApp
//
//  Created by Теона Магай on 08.02.2024.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init () {}
    
    func createTempData(_ completion: @escaping () -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            
            UserDefaults.standard.set(true, forKey: "done")
            
            let shoppingList = TaskList()
            shoppingList.name = "Shopping List"
            
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2L"
            
            let bread = Task(value: ["Bread", "", Date(), true])
            let apples = Task(value: ["name": "Apples", "note": "2Kg"])
            
            shoppingList.tasks.append(milk)
            shoppingList.tasks.insert(contentsOf: [bread, apples], at: 1)
            
            let moviesList = TaskList(value: ["Movies List", Date(), [["Best film ever"], ["The best of the best", "Must have", Date(), true]]])
            
            DispatchQueue.main.async {
                StorageManager.shared.save(taskLists: [shoppingList, moviesList])
                completion()
            }
        }
    }
}
