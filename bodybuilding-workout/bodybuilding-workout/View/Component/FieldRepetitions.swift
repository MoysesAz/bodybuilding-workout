//
//  FieldRepetitions.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct FieldRepetitions: View {
    @Binding var exercise: Exercise
    @Binding var favoriteColor: Int

    var body: some View {
        if exercise.form[favoriteColor].repetitions != nil {
            Section(header:
                        Text("Repetitions")
            ){
                Text(String(exercise.form[favoriteColor].repetitions!))
            }
        }
    }
}


