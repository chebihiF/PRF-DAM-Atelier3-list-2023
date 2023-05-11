//
//  ContentView.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 10/5/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var goaltask: GoalTask
    var body: some View {

        NavigationView{
            List{
                Section(header: GoalSectionHeader(symbolSystemName: "command.circle", headerText: "Developement")){
                    
                    ForEach(goaltask.goalsDev, content: {
                        task in
                        NavigationLink(destination: DetailsView(goal: task), label: {TaskRow(task: task)})
                    })
                }
                
                Section(header: GoalSectionHeader(symbolSystemName: "eject", headerText: "Architect")){
                    ForEach(goaltask.goalArch, content: {
                        task in
                        NavigationLink(destination: DetailsView(goal: task), label: {TaskRow(task: task)})
                    })
                }
               
                Section(header: GoalSectionHeader(symbolSystemName: "keyboard", headerText: "Beginner")){
                    ForEach(goaltask.goalBasics,  content: {
                        task in
                        NavigationLink(destination: DetailsView(goal: task), label: {TaskRow(task: task)})
                    })
                }
            }.listStyle(GroupedListStyle()).navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let goalTask = GoalTask()
        ContentView(goaltask: goalTask)
        TaskRow(task: Task(name: "Test", isComplete: false)).previewLayout(.fixed(width: 300, height: 70))
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

struct TaskRow: View {
    let task: Task
    var body: some View {
        VStack {
            if(task.isComplete){
                HStack{
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
            }else{
                HStack{
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
            
        }
    }
}
