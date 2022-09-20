//
//  FieldCombinado.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct FieldCombinado: View {
    @State var form: Form

    var body: some View {
        if form.combined != nil {
            Section(header:
                        Text("Combined:")
            ){
                Text(form.combined ?? "Not combined")

            }
        }
    }
}
