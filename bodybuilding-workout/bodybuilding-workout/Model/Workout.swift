//
//  Routines.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct Workout: Hashable {
    var name: String
    var routineDays: [RoutineDays] = [
        RoutineDays(name: "Segunda", exercices: [mock1, mock2]),
        RoutineDays(name: "Terça", exercices: [mock1, mock2]),
        RoutineDays(name: "Quarta", exercices: []),
        RoutineDays(name: "Quinta", exercices: []),
        RoutineDays(name: "Sexta", exercices: []),
        RoutineDays(name: "Sabado", exercices: []),
        RoutineDays(name: "Domingo", exercices: [])
    ]
}

