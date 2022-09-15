//
//  FieldObservation.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct FieldObservation: View {
    @Binding var exercise: Exercise
    @Binding var favoriteColor: Int

    var body: some View {
        if exercise.form[favoriteColor].observation != nil {
            Section(header:
                        Text("Observation")
            ){
                Text(exercise.form[favoriteColor].observation!)
            }
        }    }
}

