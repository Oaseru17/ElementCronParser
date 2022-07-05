//
//  File.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import Foundation

protocol ScheduleRepository {
    func saveSchedule(_ schedules: [Job])
    func fetchSchedule() -> [Job]
}

class ScheduleRepositoryImpl: ScheduleRepository {
    static let shared = ScheduleRepositoryImpl()
    
    //Todo: Improve on this to save in some location
    private var jobs = [Job]()
    
    func saveSchedule(_ schedules: [Job]) {
        jobs = schedules
    }
    
    func fetchSchedule() -> [Job] {
        jobs
    }
}
