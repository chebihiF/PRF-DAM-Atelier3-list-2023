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

        NavigationView{
            List{
                Section(header: GoalSectionHeader(symbolSystemName: "command.circle", headerText: "Developement")){
                    
                    ForEach(goalsDev, id: \.self, content: {
                        goal in
                        NavigationLink(goal, destination: DetailsView(goal_title: goal))
                    })
                }
                
                Section(header: GoalSectionHeader(symbolSystemName: "eject", headerText: "Architect")){
                    ForEach(goalArch, id: \.self, content: {
                        goal in
                        NavigationLink(goal, destination: DetailsView(goal_title: goal))
                    })
                }
               
                Section(header: GoalSectionHeader(symbolSystemName: "keyboard", headerText: "Beginner")){
                    ForEach(goalBasics, id: \.self, content: {
                        goal in
                        NavigationLink(goal, destination: DetailsView(goal_title: goal))
                    })
                }
            }.listStyle(GroupedListStyle()).navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GoalSectionHeader: View {
    var symbolSystemName: String
    var headerText : String
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: symbolSystemName)
            Text(headerText)
        }.font(.title3)
    }
}

struct DetailsView: View {
    var goal_title: String
    var body: some View {
        VStack{
            Text(goal_title)
            Text("Placeholder for description")
            Text("Placeholder for mark complete button")
        }
    }
}
