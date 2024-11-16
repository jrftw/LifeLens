//
//  Item.swift
//  LifeLens
//
//  Created by Kevin Doyle Jr. on 11/16/24.
//

import Foundation

struct Item: Identifiable, Hashable, Equatable {
    var id = UUID()
    var timestamp: Date
}
