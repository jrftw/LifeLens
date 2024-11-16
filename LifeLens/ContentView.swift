//
//  ContentView.swift
//  LifeLens
//
//  Created by Kevin Doyle Jr. on 11/16/24.
//

import SwiftUI
import os

struct ContentView: View {
    let logger = Logger(subsystem: "com.lifelens.app", category: "UI")
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Core Features")) {
                    NavigationLink(destination: LifeAssistantView()) {
                        Text("Life Assistant")
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: HealthDashboardView()) {
                        Text("Health Dashboard")
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: PlannerView()) {
                        Text("Life Planner")
                            .font(.headline)
                    }
                }
                
                Section(header: Text("Advanced Features")) {
                    NavigationLink(destination: VisionARView()) {
                        Text("Vision AR Dashboard")
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: CreativeHubView()) {
                        Text("Creative Hub")
                            .font(.headline)
                    }
                }
                
                Section(header: Text("Community")) {
                    NavigationLink(destination: CommunityView()) {
                        Text("Community & Sharing")
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("LifeLens")
            .onAppear {
                logger.info("ContentView appeared")
            }
        }
    }
}
