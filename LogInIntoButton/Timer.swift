//
//  Timer.swift
//  LogInIntoButton
//
//  Created by Сергей Веретенников on 15/05/2022.
//

import Foundation
import Combine

class SomeTimer: ObservableObject {
    
    let changesInObject = PassthroughSubject<SomeTimer, Never>()
    
    var timerCount = 3
    var timer: Timer?
    var buttonName = "Start"
    
    func startTimer() {
        if timerCount > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(changeTimer),
                userInfo: nil,
                repeats: true
            )
        }
        setButtonName()
    }
    
    @objc private func changeTimer() {
        if timerCount > 0 {
            timerCount -= 1
        } else {
            stopTimer()
            buttonName = "Reload"
        }
        changesInObject.send(self)
    }
    
    private func setButtonName() {
        if buttonName == "Reload" {
            buttonName = "Start"
            timerCount = 3
        } else {
            buttonName = "Wait..."
        }
        changesInObject.send(self)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
