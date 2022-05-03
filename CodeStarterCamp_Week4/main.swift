//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var tiredness = 0
    
    init() {
        upperBodyStrength = 30
        lowerBodyStrength = 30
        muscleEndurance = 10
    }
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
    }
    
    func informBodyCondition(){
        let informationOfBodyCondition = """
----------------------------------
현재의 컨디션은 다음과 같습니다.
상체근력 : \(upperBodyStrength)
하체근력 : \(lowerBodyStrength)
근지구력 : \(muscleEndurance)
피로도  : \(tiredness)
"""
        print(informationOfBodyCondition)
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> BodyCondition
}

struct Routine {
    let name: String
    var exercises = [Exercise]()
    
    init(name: String) {
        self.name = name
    }
    init(name: String, exercises: Exercise...) {
        self.name = name
        self.exercises = exercises
    }
    
    mutating func appendExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }
    
    mutating func insertExercise(_ exercise: Exercise, at point: Int) {
        if point < exercises.count {
            exercises.insert(exercise, at: point)
        }
    }
    
    mutating func removeExercise(at point: Int) {
        if point < exercises.count {
            exercises.remove(at: point)
        }
    }
    
    func startRoutine(bodyCondition: BodyCondition) -> BodyCondition {
        var exerciserBodyCondition = bodyCondition
        print("----------------------------------")
        if exercises.isEmpty {
            print("Don't start \(name) Routine because \(name) Routine is empty")
            return exerciserBodyCondition
        } else {
            print("\(name) Routine Start")
        }
        print("----------------------------------")
        for exercise in exercises {
            print("\(exercise.name)")
            exerciserBodyCondition = exercise.action(exerciserBodyCondition)
        }
        exerciserBodyCondition.informBodyCondition()
        return exerciserBodyCondition
    }
}

let pushUp = Exercise(name: "팔굽혀펴기") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 5...15)
    temporaryBodyCondition.tiredness += Int.random(in: 5...10)
    return temporaryBodyCondition
}

let chinUp = Exercise(name: "턱걸이") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 15...20)
    temporaryBodyCondition.tiredness += Int.random(in: 10...15)
    return temporaryBodyCondition
}

let dip = Exercise(name: "딥스") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 8...14)
    temporaryBodyCondition.tiredness += Int.random(in: 5...10)
    return temporaryBodyCondition
}

let sitUp = Exercise(name: "윗몸일으키기") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 10...20)
    temporaryBodyCondition.tiredness += Int.random(in: 10...20)
    return temporaryBodyCondition
}

let squatting = Exercise(name: "스쿼트") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    temporaryBodyCondition.tiredness += Int.random(in: 10...20)
    return temporaryBodyCondition
}

let lunge = Exercise(name: "런지") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.lowerBodyStrength += Int.random(in: 15...20)
    temporaryBodyCondition.tiredness += Int.random(in: 7...10)
    return temporaryBodyCondition
}

let longRun = Exercise(name: "오래달리기") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.muscleEndurance += Int.random(in: 10...20)
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 5...10)
    temporaryBodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    temporaryBodyCondition.tiredness += Int.random(in: 10...20)
    return temporaryBodyCondition
}

let activeRest = Exercise(name: "동적휴식") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.tiredness -= Int.random(in: 5...10)
    if temporaryBodyCondition.tiredness < 0 {
        temporaryBodyCondition.tiredness = 0
    }
    return temporaryBodyCondition
}
