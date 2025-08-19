//
//  HealthKitManager.swift
//  OneStep
//
//  Created by Lucid on 8/18/25.
//

import SwiftUI
import HealthKit

class HealthKitManager: ObservableObject {
    
    private let healthStore = HKHealthStore()
    
    @Published var todaySteps: Int = 0
    @Published var weekSteps: Int = 0
    
    init() {
        requestAuthorization()
    }
    
    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else { return }
        
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        healthStore.requestAuthorization(toShare: [], read: [stepType]) { success, error in
            if success {
                self.fetchTodaySteps()
                self.fetchWeekSteps()
            }
        }
    }
    
    // 오늘 걸음수
    func fetchTodaySteps() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let startOfDay = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: Date())
        
        let query = HKStatisticsQuery(quantityType: stepType,
                                      quantitySamplePredicate: predicate,
                                      options: .cumulativeSum) { _, result, _ in
            guard let result = result,
                  let sum = result.sumQuantity() else { return }
            
            DispatchQueue.main.async {
                self.todaySteps = Int(sum.doubleValue(for: HKUnit.count()))
            }
        }
        healthStore.execute(query)
    }

    // 이번주 걸음수
    func fetchWeekSteps() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        // 이번 주 시작 날짜 (월요일 기준)
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfWeek, end: Date())
        
        let query = HKStatisticsQuery(quantityType: stepType,
                                      quantitySamplePredicate: predicate,
                                      options: .cumulativeSum) { _, result, _ in
            guard let result = result,
                  let sum = result.sumQuantity() else { return }
            
            DispatchQueue.main.async {
                self.weekSteps = Int(sum.doubleValue(for: HKUnit.count()))
            }
        }
        healthStore.execute(query)
    }
}
