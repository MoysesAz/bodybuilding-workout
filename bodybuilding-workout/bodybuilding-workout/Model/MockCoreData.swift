//
//  MockCoreData.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 17/09/22.
//

import SwiftUI

class MockCoreData: ObservableObject {
    var id = UUID()

    @Published var workouts: [Workout] = [Workout(name: "teste")]

    func addWorkout(name: String){
        workouts.append(Workout(name: name))
    }

    func removeWorkout(value: Int){
        workouts.remove(at: value)
    }
}

extension MockCoreData: Hashable {
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id.uuidString)
    }

    public static func == (lhs: MockCoreData, rhs: MockCoreData) -> Bool {
        return lhs.id == rhs.id
    }
}
