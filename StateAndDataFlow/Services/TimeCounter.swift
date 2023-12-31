//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import Foundation
import Combine

final class TimeCounter: ObservableObject {
    var counter = 3
    var buttonTitle = "Start"
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var timer: Timer?
    
    func start() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc
    private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self)
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
