//
//  FieldCombinado.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct FieldCombinado: View {
    @Binding var exercise: Exercise
    @Binding var favoriteColor: Int

    var body: some View {
        if exercise.form[favoriteColor].combined != nil {
            Section(header:
                        Text("Mix:")
            ){
                Text(exercise.form[favoriteColor].combined!)

            }
        }
    }
}
