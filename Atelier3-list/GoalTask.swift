//
//  GoalTask.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 11/5/2023.
//

import Foundation

class GoalTask: ObservableObject {
    @Published var goalsDev = [
        Task(name: "Lear Java OOP", isComplete: false, lastComplete: nil),
        Task(name: "Lear Android", isComplete: false, lastComplete: nil),
        Task(name: "Learn IOS", isComplete: false, lastComplete: nil),
        Task(name: "Learn React", isComplete: false, lastComplete: nil),
        Task(name: "Learn Docker", isComplete: false, lastComplete: nil),
        Task(name: "Learn Kubernetes", isComplete: false, lastComplete: nil),
    ]

    @Published var goalArch = [
        Task(name: "Learn DevOps", isComplete: true, lastComplete: nil),
        Task(name: "Learn Agil", isComplete: false, lastComplete: nil),
        Task(name: "Learn Scrum", isComplete: false, lastComplete: nil),
        Task(name: "Learn Lean", isComplete: false, lastComplete: nil),
        Task(name: "Lear ITIL", isComplete: false, lastComplete: nil),
    ]

    @Published var goalBasics = [
        Task(name: "Algorithme", isComplete: false, lastComplete: nil),
        Task(name: "C langage", isComplete: false, lastComplete: nil),
        Task(name: "Python", isComplete: false, lastComplete: nil),
        Task(name: "OOP", isComplete: false, lastComplete: nil),
        Task(name: "DataBase", isComplete: false, lastComplete: nil),
    ]
}
