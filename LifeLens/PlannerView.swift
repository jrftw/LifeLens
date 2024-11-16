import SwiftUI
import os

struct PlannerView: View {
    @State private var tasks: [String] = ["Plan project", "Workout"]
    @State private var newTask: String = ""
    
    let logger = Logger(subsystem: "com.lifelens.app", category: "Planner")
    
    var body: some View {
        VStack {
            Text("Life Planner")
                .font(.title)
                .padding()
            
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
            }
            
            HStack {
                TextField("New Task", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add") {
                    tasks.append(newTask)
                    newTask = ""
                    logger.info("New task added")
                }
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            logger.info("PlannerView appeared")
        }
    }
}