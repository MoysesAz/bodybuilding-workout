//
//  Routines.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct Workout {
    init(name: String, routineDays: [RoutineDay] = [
        RoutineDay(name: "Segunda", exercices: [

            Exercise(name: "Agachamento Livre", series: 3, form:[ExerciseForm(
                description: "Cabeça Para Baixo", observation: "Cuidado"
            )])

        ]),
        RoutineDay(name: "Terça", exercices: []),
        RoutineDay(name: "Quarta", exercices: []),
        RoutineDay(name: "Quinta", exercices: []),
        RoutineDay(name: "Sexta", exercices: []),
        RoutineDay(name: "Sabado", exercices: []),
        RoutineDay(name: "Domingo", exercices: [])
    ]) {
        self.name = name
        self.routineDays = routineDays
    }

    var id = UUID()
    var name: String
    var routineDays: [RoutineDay]
    var percentege: Float?
}



extension Workout: Identifiable, Hashable  {

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id.uuidString)
    }

    public static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.id == rhs.id
    }

}
