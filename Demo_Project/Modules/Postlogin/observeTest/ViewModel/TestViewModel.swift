//
//  ViewModel.swift
//  TESTobser
//
//  Created by Tradesocio on 22/04/22.
//

import Foundation

class TestViewModel {
    // with the use of observables
    var testValue:ObservabObjec<String> = ObservabObjec("")
    var coun:ObservabObjec<String> = ObservabObjec("")
    var lblfirst:ObservabObjec<String> = ObservabObjec("")
    weak var timer: Timer?
    var count:Int = 1234
    
    // with the use of combine
    @Published var lblLast:String?
    
    
     func startTimer() {
       timer?.invalidate()
       let interval = Double(Date().timeIntervalSinceReferenceDate)
       let delay = 60  - fmod(interval, 60.0)
         self.testValue.value = "Delay = \(delay)"

       //Create a "one-off" timer that fires on the next even minute
      let _ = Timer.scheduledTimer(withTimeInterval: delay, repeats: false ) { timer in
      self.testValue.value = "\(Date())"
      self.timer = Timer.scheduledTimer(withTimeInterval: 1,
                                           repeats: true ) { timer in
                                             //Put your repeating code here.
      self.testValue.value = "\(Date())"
         }
       }
     }
    
    func counter() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.count = self.count + 1
            DispatchQueue.main.async {
                self.coun.value = "\(self.count)"
            }
        }
    }
    func setuser() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.count = self.count + 2
            DispatchQueue.main.async {
                self.lblfirst.value = "without combine -> \(self.count)"
            }
          
        }
      
    }
    func lastName() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.count = self.count + 2
            DispatchQueue.main.async {
                self.lblLast = "combine -> \(self.count)"
            }
          
        }
    }
    
}
