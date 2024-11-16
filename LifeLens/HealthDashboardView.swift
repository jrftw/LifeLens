//
//  HealthDashboardView.swift
//  LifeLens
//
//  Created by Kevin Doyle Jr. on 11/16/24.
//

import SwiftUI
import HealthKit
import os

struct HealthDashboardView: View {
    @State private var healthStats: String = "Loading health data..."
    let logger = Logger(subsystem: "com.lifelens.app", category: "HealthDashboard")
    
    let healthStore = HKHealthStore()
    
    var body: some View {
        VStack {
            Text("Health Dashboard")
                .font(.title)
                .padding()
            
            Text(healthStats)
                .padding()
            
            Spacer()
        }
        .onAppear {
            logger.info("HealthDashboardView appeared")
            requestHealthData()
        }
    }
    
    func requestHealthData() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        healthStore.requestAuthorization(toShare: nil, read: [stepType]) { success, error in
            if success {
                fetchStepCount()
            } else {
                logger.error("HealthKit authorization failed: \(String(describing: error))")
            }
        }
    }
    
    func fetchStepCount() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: nil, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                logger.error("Error fetching step count: \(String(describing: error))")
                return
            }
            
            DispatchQueue.main.async {
                self.healthStats = "Total Steps: \(sum.doubleValue(for: HKUnit.count()))"
                logger.info("Health data updated: \(self.healthStats)")
            }
        }
        healthStore.execute(query)
    }
}
