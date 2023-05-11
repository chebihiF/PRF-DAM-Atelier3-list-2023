//
//  Task.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 11/5/2023.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name : String
    var isComplete: Bool
    var lastComplete : Date?
}
