//
//  DataManager.swift
//  JhMemo
//
//  Created by jh on 2020/09/12.
//  Copyright © 2020 jh. All rights reserved.
//

import Foundation
import CoreData


class DataManager {
    //싱글톤구현
    static let shared = DataManager()
    private init() {
        
    }
    
    var mainContenxt: NSManagedObjectContext {
        return persistentContainer.viewContext
        
    }
    
    var memoList = [Memo]()
    
    //DB에서 데이터 읽어오기1. 페치리퀘스트 설정
    func fetchMemo() {
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        do {
            memoList = try mainContenxt.fetch(request)
        } catch {
            print(error)
        }
        
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "JhMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
