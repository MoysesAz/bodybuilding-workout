//
//  FieldRepetitions.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct FieldRepetitions: View {
    @State var form: Form

    var body: some View {
        if form.repetitions != 0 {
            Section(header:
                        Text("Repetitions")
            ){
                Text(String(form.repetitions))
            }
        }
    }
}


