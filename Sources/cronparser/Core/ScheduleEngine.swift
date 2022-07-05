//
//  File.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import Foundation

class ScheduleEngine {
    
    let repository: ScheduleRepository
    let cronParser: CronParser
    let validator: Validator
    
    init(repository: ScheduleRepository = ScheduleRepositoryImpl.shared,
         cronParser: CronParser = CronParserImpl.shared,
         validator: Validator = ValidatorImpl.shared) {
        self.repository = repository
        self.cronParser = cronParser
        self.validator = validator
    }
    
    func start() {
        if let scheduleString = getSchedule() {
            repository.saveSchedule(cronParser.parseString(value: scheduleString))
        } else {
            print("missingConfig".localized)
        }
    }
    
    func getSchedule(_ input: String) -> [NextRunSchedule] {
        guard let timeValues = validateInput(input) else {
            print("errorValidatingInput".localized)
            return []
        }
        return getNextScheduleFor(hour: timeValues.0, minute: timeValues.1)
    }
    
    private func getSchedule() -> String? {
        var scheduleString: String?
        if FileHelper.doesFileExist(filePath: Config.defaultConfigLocation) {
            scheduleString = try? FileHelper.readFile(filePath: Config.defaultConfigLocation)
        } else {
            print("usingDefaultConfig".localized)
            scheduleString = try? Config.getDefaultConfig()
        }
        return scheduleString
    }
    
    private func validateInput(_ input: String) -> (Int, Int)? {
        let inputs = input.split(separator: ":")
        
        guard inputs.count == 2 else { return nil }
        guard var hour = validator.validateHour(hour: String(inputs[0])) else { return nil }
        guard var minute = validator.validateMinute(minute: String(inputs[1])) else { return nil }
        
        if hour == 24 && minute > 0 {
            return nil
        }
        
        if minute == 60 {
            minute = 0
            hour += 1
        }
        
        if hour == 24 {
            hour = 0
        }
        
        // No need to check if hour greater than 24 as validator handles
        return (hour, minute)
    }
    
    private func getNextScheduleFor(hour: Int, minute: Int) -> [NextRunSchedule] {
        var nextSchedule = [NextRunSchedule]()
        
        for job in repository.fetchSchedule() {
            if job.hour == -1 {
                if job.minute == -1 {
                    nextSchedule.append(NextRunSchedule(hour: hour, minute: minute, today: true, script: job.script))
                } else {
                    nextSchedule.append(compareMinutes(job: job, inputTime: (hour, minute)))
                }
                continue
            }
            if job.hour > hour {
                nextSchedule.append(NextRunSchedule(hour: job.hour, minute: job.minute, today: true, script: job.script))
            } else if job.hour < hour {
                nextSchedule.append(NextRunSchedule(hour: job.hour, minute: job.minute, today: false, script: job.script))
            } else {
                nextSchedule.append(compareMinutes(job: job, inputTime: (hour, minute)))
            }
        }
        return nextSchedule
    }
    
    private func compareMinutes(job: Job, inputTime: (Int, Int)) -> NextRunSchedule {
        if job.minute == -1 {
            return NextRunSchedule(hour: inputTime.0, minute: inputTime.1, today: true, script: job.script)
        }
        if job.minute < inputTime.1 {
            return NextRunSchedule(hour: inputTime.0, minute: inputTime.1, today: false, script: job.script)
        } else if job.minute > inputTime.1 {
            return NextRunSchedule(hour: inputTime.0, minute: job.minute, today: true, script: job.script)
        } else {
            return NextRunSchedule(hour: job.hour, minute: job.minute, today: true, script: job.script)
        }
    }
}
