//
//  MainView.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case Agents
    case Bundles
    case Maps
    case Weapons
    case Seasons
}
struct MainView: View {
    @ObservedObject var agents = AgentViewModel()
    @State private var selectedTab = 0
    var body: some View {
         NavigationStack {
            TabView(selection: $selectedTab) {
                ZStack {
                    Color.white
                        .ignoresSafeArea(.all)
                    if let agents = agents.agentsData?.data {
                        AgentsView(agents: agents)
                    }
                }
                .tabItem {
                    Image(systemName: "figure.arms.open")
                    Text("Agents")
                }
                .bold()
                .tag(0)
                ZStack {
                    Color.white
                        .ignoresSafeArea(.all)
                }
                .tabItem {
                    Image(systemName: "shippingbox.circle")
                    Text("Bundles")
                }
                .bold()
                .tag(1)
                ZStack {
                    Color.white
                        .ignoresSafeArea(.all)
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("Maps")
                }
                .bold()
                .tag(2)
                ZStack {
                    Color.white
                        .ignoresSafeArea(.all)
                }
                .tabItem {
                    Image(systemName: "oar.2.crossed")
                    Text("Weapons")
                }
                .bold()
                .tag(3)
                ZStack {
                    Color.white
                        .ignoresSafeArea(.all)
                }
                .tabItem {
                    Image(systemName: "moonphase.last.quarter.inverse")
                    Text("Seasons")
                }
                .bold()
                .tag(4)
                
            }
            .tint(Color.red)
            .navigationBarHidden(false)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
