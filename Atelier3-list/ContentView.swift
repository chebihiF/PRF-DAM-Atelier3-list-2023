//
//  ContentView.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 10/5/2023.
//

import SwiftUI

let goalsDev = [
    "Lear Java OOP",
    "Lear Android",
    "Learn IOS",
    "Learn React",
    "Learn Docker",
    "Learn Kubernetes",
]

let goalArch = [
    "Learn DevOps",
    "Learn Agil",
    "Learn Scrum",
    "Learn Lean",
    "Lear ITIL"
]

let goalBasics = [
    "Algorithme",
    "C langage",
    "Python",
    "OOP",
    "DataBase"
]

struct ContentView: View {
    var body: some View {

        List{
            Section(header: HStack{
                Image(systemName: "wand.and.rays")
                Text("Developement")
            }.font(.title3)){
                
                ForEach(goalsDev, id: \.self, content: {
                    goal in
                    Text(goal)
                })
            }
            
            Section(header: HStack{
                Image(systemName: "dial.high")
                Text("Architect")
            }.font(.title3)){
                ForEach(goalArch, id: \.self, content: {
                    goal in
                    Text(goal)
                })
            }
           
            Section(header: HStack{
                Image(systemName: "hourglass.bottomhalf.filled")
                Text("Beginner")
            }.font(.title3)){
                ForEach(goalBasics, id: \.self, content: {
                    goal in
                    Text(goal)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
