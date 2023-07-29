//
//  AgentsView.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct AgentsView: View {
    let agents: [AgentsDatum]
    var body: some View {
        List(agents, id: \.uuid) { agent in
            AgentCellView(agent: agent)
        }
        .listRowInsets(EdgeInsets())
  
    }
}
struct AgentCellView: View {
    let agent: AgentsDatum
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
            WebImage(url: URL(string: agent.killfeedPortrait ))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(8)
                .clipped()
            VStack(alignment: .leading, spacing: 8) {
                Text(agent.displayName)
                    .font(.title)
                    .foregroundColor(.white)
                //                Text("Type: \(agent.role?.displayName?.rawValue)")
                //                    .font(.headline)
                //                    .foregroundColor(.white)
                Text(agent.description.prefix(100)) // Show only the first 100 characters of the description
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}
//struct AgentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AgentsView()
//    }
//}
