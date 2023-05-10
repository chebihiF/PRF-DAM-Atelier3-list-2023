//
//  DetailsView.swift
//  Atelier3-list
//
//  Created by CHEBIHI FAYCAL on 10/5/2023.
//

import SwiftUI

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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(goal_title: "Test")
    }
}
