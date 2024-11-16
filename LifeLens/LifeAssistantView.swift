//
//  LifeAssistantView.swift
//  LifeLens
//
//  Created by Kevin Doyle Jr. on 11/16/24.
//

import SwiftUI
import os

struct LifeAssistantView: View {
    @State private var userQuery: String = ""
    @State private var aiResponse: String = "Ask me anything to improve your day."
    
    let logger = Logger(subsystem: "com.lifelens.app", category: "LifeAssistant")
    
    var body: some View {
        VStack {
            Text("Life Assistant")
                .font(.title)
                .padding()
            
            TextField("How can I help you?", text: $userQuery, onCommit: fetchAIResponse)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text(aiResponse)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .onAppear {
            logger.info("LifeAssistantView appeared")
        }
    }
    
    func fetchAIResponse() {
        logger.info("Fetching AI response for query: \(userQuery)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.aiResponse = "Here's what I suggest for '\(userQuery)': Stay positive and organized!"
            logger.info("AI response delivered: \(self.aiResponse)")
        }
    }
}
