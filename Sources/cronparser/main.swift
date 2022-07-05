import Foundation
import ArgumentParser

struct Application: ParsableCommand {

    public static let configuration = CommandConfiguration(abstract: "Welcome!!! to Precious submission for element")

    @Argument(help: "Please enter the time to be fired in format HH:MM")
    private var inputTime: String

    init() { }
    
    func run() {
        let scheduler = ScheduleEngine()
        scheduler.start()
        for runSchedule in scheduler.getSchedule(inputTime) {
            print(runSchedule)
        }
    }
}

Application.main()
