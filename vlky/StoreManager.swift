//
//  StoreManager.swift
//  vlky
//
//  Created by T Krobot on 27/11/22.
//

import Foundation
import SwiftUI

class StoreManager: ObservableObject {
    @Published var storeItem: StoreItem = StoreItem(foodItem: [], decoItem: [], mascotItem: []) {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "storeItem.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedStoreItem = try? propertyListEncoder.encode(storeItem)
        try? encodedStoreItem?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrievedStoreItemData = try? Data(contentsOf: archiveURL),
           let decodedStoreItem = try? propertyListDecoder.decode(StoreItem.self, from: retrievedStoreItemData) {
            storeItem = decodedStoreItem
        }
    }
}
