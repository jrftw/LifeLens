//
//  Item.swift
//  LifeLens
//
//  Created by Kevin Doyle Jr. on 11/16/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
