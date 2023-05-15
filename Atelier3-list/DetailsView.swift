//
//  DetailsView.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 10/5/2023.
//

import SwiftUI

struct DetailsView: View {
    @Binding var goal: Task
    var body: some View {
        VStack{
            Text(goal.name)
            Text("Placeholder for description")
            Button("Mark Complete"){
                goal.isComplete = true
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(goal: Binding<Task>.constant(Task(name: "Test", isComplete: false)))
    }
}
