//
//  Atelier3_listApp.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 10/5/2023.
//

import SwiftUI

@main
struct Atelier3_listApp: App {
    
    @StateObject private var goalTask = GoalTask()
    
    var body: some Scene {
        WindowGroup {
            ContentView(goaltask: goalTask)
                .environmentObject(goalTask)
        }
    }
}
