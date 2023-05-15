//
//  ContentView.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 10/5/2023.
//

import SwiftUI 

struct ContentView: View {
    
    @ObservedObject var goaltask: GoalTask
    @State private var focuseModeOn = false
    @State private var resetAlertShowing = false
    
    var body: some View {

        NavigationView {
            List {
                Section(header: GoalSectionHeader(symbolSystemName: "command.circle", headerText: "Developement")){
                    
                    let taskIndices = goaltask.goalsDev.indices
                    let tasks = goaltask.goalsDev
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndice in
                        
                        let goalsDevTaskWrapper = $goaltask
                        let taskBinding = goalsDevTaskWrapper.goalsDev
                        let theTaskBinding = taskBinding[taskIndice]
                        
                        if !focuseModeOn || (focuseModeOn && task.isComplete == false){
                            
                            NavigationLink(destination: DetailsView(goal: theTaskBinding), label: {TaskRow(task: task)})
                        }
                    }).onDelete(perform: { indexSet in
                        goaltask.goalsDev.remove(atOffsets: indexSet)
                    }).onMove(perform: {indices, newOffset in
                        goaltask.goalsDev.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
              
                Section(header: GoalSectionHeader(symbolSystemName: "eject", headerText: "Architect")){
                    
                    let taskIndices = goaltask.goalArch.indices
                    let tasks = goaltask.goalArch
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndice in
                        
                        let goalsArchTaskWrapper = $goaltask
                        let taskBinding = goalsArchTaskWrapper.goalArch
                        let theTaskBinding = taskBinding[taskIndice]
                        
                        if !focuseModeOn || (focuseModeOn && task.isComplete == false){
                            
                            NavigationLink(destination: DetailsView(goal: theTaskBinding), label: {TaskRow(task: task)})
                        }
                    }).onDelete(perform: { indexSet in
                        goaltask.goalArch.remove(atOffsets: indexSet)
                    }).onMove(perform: {indices, newOffset in
                        goaltask.goalArch.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
               
                Section(header: GoalSectionHeader(symbolSystemName: "keyboard", headerText: "Beginner")){
                    
                    let taskIndices = goaltask.goalBasics.indices
                    let tasks = goaltask.goalBasics
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndice in
                        
                        let goalsBasicTaskWrapper = $goaltask
                        let taskBinding = goalsBasicTaskWrapper.goalBasics
                        let theTaskBinding = taskBinding[taskIndice]
                        
                        if !focuseModeOn || (focuseModeOn && task.isComplete == false){
                            
                            NavigationLink(destination: DetailsView(goal: theTaskBinding), label: {TaskRow(task: task)})
                        }
                    }).onDelete(perform: { indexSet in
                        goaltask.goalBasics.remove(atOffsets: indexSet)
                    }).onMove(perform: {indices, newOffset in
                        goaltask.goalBasics.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Reset") {
                        resetAlertShowing = true
                    }
                }
                
                ToolbarItem(placement: .bottomBar){
                    Toggle(isOn: $focuseModeOn, label: {
                        Text("Focus Mode")
                    }).toggleStyle(.switch)
                }
            }
        }.alert(isPresented: $resetAlertShowing, content: {
            Alert(title: Text("Reset List"), message: Text("Are you sure ?"),
                  primaryButton: .cancel(),
                  secondaryButton:.destructive(Text("Yes, reset it"), action: {
                let refreshedGoalTasks = GoalTask()
                self.goaltask.goalsDev = refreshedGoalTasks.goalsDev
                self.goaltask.goalArch = refreshedGoalTasks.goalArch
                self.goaltask.goalBasics = refreshedGoalTasks.goalBasics
            }))
        })
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
