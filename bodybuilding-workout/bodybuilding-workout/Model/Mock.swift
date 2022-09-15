//
//  Mock.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 13/09/22.
//

import Foundation
var mockDeus: [Workout] = [mock0, mock01]
var mock0 = Workout(name: "First Workout")

var mock01 = Workout(name: "Second Workout")

var mock1 = Exercise(name: "Agachamento Livre", series: 3,form: [
    Form(description: "Descendo em 3 segundos e subindo rápido", observation: "Sem descanço fazer a próxima variação", repetitions: 10),
    Form(description: "Normal", repetitions: 10),
    Form(description: "Sobe até o meio e volta.", observation: "Com anilha de 1kg no calcanhar", repetitions: 10, combined:  "agachamento unilateral"),
])

var mock2 = Exercise(name: "Leg", series: 1 ,form: [
    Form(description: "80% peso máximo", repetitions: 15),
    Form(description: "+ 20kg", repetitions: 12),
    Form(description: "+ 20kg", repetitions: 10),
    Form(description: "+ 20kg", repetitions: 8),
    Form(description: "+ 20kg", repetitions: 6),
    Form(description: "80% peso máximo", repetitions: 15),
    Form(description: "+ 20kg", repetitions: 12),
    Form(description: "+ 20kg", repetitions: 10),
    Form(description: "+ 20kg", repetitions: 8),
    Form(description: "+ 20kg", repetitions: 6),
])

//Leg: 80% peso máximo faz 15 repetições, depois aumenta 20kg e faz 12 repetições, aumenta 20kg e faz 10 repetições aumenta mais 20 e faz 8 repetições.se conseguir aumenta e faz 6 repetições Combina com agachamento unilateral 10 repetições cada.
