//
//  FieldObservation.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct FieldObservation: View {
    @State var form: Form

    var body: some View {
        if form.observation != nil {
            Section(header:
                        Text("Observation: ")
            ){
                Text(form.observation ?? "No observation")
            }
        }    }
}

