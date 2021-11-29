//
//  TimeConverter.swift
//  BerlinClock
//
//  Created by ablai erzhanov on 20.11.2021.
//

import Foundation


class TimeConverter: ObservableObject {
    var calendar = Calendar.current
    
    @Published var fiveHoursBulps: [Bool] = [false, false, false, false]
    @Published var singleHoursBulps: [Bool] = [false, false, false, false]
    @Published var fiveMinutesBulps: [Bool] = [false, false, false, false, false, false, false, false, false, false, false]
    @Published var singleMinutesBulps: [Bool] = [false, false, false, false]
    @Published var secondsBulps: [Bool] = [false]
    
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    func convertTimeToString(_ hours: Int, minutes: Int, seconds: Int, completion: @escaping(() -> Void)) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
        
        getFiveHours(hours) {
            self.getSingleHours(hours) {
                self.getFiveMinutes(minutes) {
                    self.getSingleMinutes(minutes) {
                        self.getSeconds(seconds) {
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    func getFiveHours(_ hours: Int, completion: @escaping(() -> Void)) {
        self.fiveHoursBulps = getLights(hours / 5, totalCountOfBulps: 4)
        completion()
    }
    
    func getSingleHours(_ hours: Int, completion: @escaping(() -> Void)) {
        self.singleHoursBulps = getLights(hours % 5, totalCountOfBulps: 4)
        completion()
    }
    
    func getFiveMinutes(_ minutes: Int, completion: @escaping(() -> Void)) {
        self.fiveMinutesBulps = getLights(minutes / 5, totalCountOfBulps: 11)
        completion()
    }
    
    func getSingleMinutes(_ minutes: Int, completion: @escaping(() -> Void)) {
        self.singleMinutesBulps = getLights(minutes % 5, totalCountOfBulps: 4)
        completion()
    }
    
    func getSeconds(_ seconds: Int, completion: @escaping(() -> Void)) {
        if seconds % 2 == 0 {
            self.secondsBulps = [true]
            completion()
        } else {
            self.secondsBulps = [false]
            completion()
        }
    }
    
    func getLights(_ turnedOn: Int, totalCountOfBulps: Int) -> [Bool] {
        let onBulps = Array(repeating: true, count: turnedOn)
        let offBulps = Array(repeating: false, count: totalCountOfBulps - turnedOn)
        
        return onBulps + offBulps
    }
}
