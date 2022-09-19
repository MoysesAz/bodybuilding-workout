//
//  Days.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import Foundation

struct RoutineDay {
    var id = UUID()
    var name: String
    var exercices: [Exercise] = []

    init(name: String, exercices: [Exercise] = []) {
        self.name = name
        self.exercices = exercices
    }

    mutating func addExercise(){
        exercices.append(
            Exercise(name: "Pé de Cabra Livre", series: 3, form:[ExerciseForm(
            description: "Cabeça Para Baixo", observation: "Cuidado"
        )]))
    }
}

extension RoutineDay: Hashable  {
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id.uuidString)
    }

    public static func == (lhs: RoutineDay, rhs: RoutineDay) -> Bool {
        return lhs.id == rhs.id
    }

}
