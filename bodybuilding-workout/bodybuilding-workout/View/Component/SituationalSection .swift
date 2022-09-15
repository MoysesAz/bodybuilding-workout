//
//  SituationalSection .swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct SituationalSection: View {
    @Binding var value: Exercice
    var name: String

    var body: some View {
        if let string = validationValue() {
            Section(
                header:
                    Text(name)
            ){
                Text(string)
            }
        }
    }

}

struct SituationalSection__Previews: PreviewProvider {
    static var previews: some View {
        SituationalSection(value: "a", name: "observation")
    }
}
