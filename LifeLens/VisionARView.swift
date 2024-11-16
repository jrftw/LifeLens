//
//  VisionARView.swift
//  LifeLens
//
//  Created by Kevin Doyle Jr. on 11/16/24.
//

import SwiftUI
import os

struct VisionARView: View {
    let logger = Logger(subsystem: "com.lifelens.app", category: "VisionAR")
    
    var body: some View {
        VStack {
            Text("AR Dashboard (Placeholder for VisionOS)")
                .font(.title)
                .padding()
            
            Text("ARView is a placeholder until visionOS implementation.")
                .foregroundColor(.gray)
                .padding()
        }
        .onAppear {
            logger.info("VisionARView appeared")
        }
    }
}
