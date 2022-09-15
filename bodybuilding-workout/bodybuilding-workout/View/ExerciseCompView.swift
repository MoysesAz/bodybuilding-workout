//
//  ExerciseCompView.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct ExerciseCompView: View {
    @Binding var exercises: [Exercise]
    var body: some View {
        ForEach($exercises, id: \.self) { $exercise in
            HStack(spacing: 20) {
                Text(exercise.name)
                Spacer()
                Percentage(value: 77)
                    .padding([.trailing], 10)
            }
        }
    }
}

//struct ExerciseCompView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseCompView()
//    }
//}
