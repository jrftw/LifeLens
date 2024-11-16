//
//  LifeLensApp.swift
//  LifeLens
//
//  Created by Kevin Doyle Jr. on 11/16/24.
//

import SwiftUI
import os

@main
struct LifeLensApp: App {
    @Environment(\.scenePhase) var scenePhase
    let logger = Logger(subsystem: "com.lifelens.app", category: "Lifecycle")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    logger.info("LifeLens App Launched")
                }
                .onChange(of: scenePhase) { newPhase in
                    switch newPhase {
                    case .active:
                        logger.info("App is active")
                    case .inactive:
                        logger.info("App is inactive")
                    case .background:
                        logger.info("App is in background")
                    @unknown default:
                        logger.error("Unknown app state encountered")
                    }
                }
        }
    }
}
