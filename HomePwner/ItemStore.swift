//
//  ItemStore.swift
//  HomePwner
//
//  Created by Arian Moslem on 6/2/16.
//  Copyright © 2016 Arian Moslem. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    let itemArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLBYAppendingPathComponent("items.archive")
    }()
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(item: Item) {
        if let index = allItems.indexOf(item) {
            allItems.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        //Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        //Remove item from array
        allItems.removeAtIndex(fromIndex)
        
        //Insert item in array at new location
        allItems.insert(movedItem, atIndex: toIndex)
    }
}
