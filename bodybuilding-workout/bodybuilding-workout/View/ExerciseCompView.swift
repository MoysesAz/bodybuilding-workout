//
//  ExerciseCompView.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct ExerciseCompView: View {
    @EnvironmentObject var mock: MockCoreData
    var indexWorkout: Int
    var indexDay: Int

    var body: some View {
        ForEach(mock.workouts[indexWorkout].routineDays[indexDay].exercices.indices, id: \.self) { indexExercise in
            NavigationLink(destination: WorkoutsOfTheDay(exercise: $mock.workouts[indexWorkout].routineDays[indexDay].exercices[indexExercise])){
                HStack(spacing: 20) {
                    Text(mock.workouts[indexWorkout].routineDays[indexDay].exercices[indexExercise].name)
                    Spacer()
                    Percentage(value: 77)
                        .padding([.trailing], 10)
                }
            }
        }

    }
    
}

//struct ExerciseCompView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseCompView()
//    }
//}
