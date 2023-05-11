//
//  DetailsView.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 10/5/2023.
//

import SwiftUI

struct DetailsView: View {
    var goal: Task
    var body: some View {
        VStack{
            Text(goal.name)
            Text("Placeholder for description")
            Text("Placeholder for mark complete button")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(goal: Task(name: "Test", isComplete: false))
    }
}
