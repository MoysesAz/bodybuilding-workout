//
//  ExerciseView.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct ExerciseView: View {
    //    @State private var favoriteColor = 0
    @Binding var exercises: [Exercise]
    var body: some View {
        List {
            Section(header:
                        Text("Exercises")
                .bold()
            ){
                    ForEach($exercises, id: \.self){ $exercise in
                        NavigationLink(destination: WorkoutsOfTheDay(exercise: $exercise)){
                            HStack{
                                Text(exercise.name)
                                Spacer()
                                Percentage(value: 100)
                            }
                        }
                    }
            }
        }.navigationBarTitle("Exercises", displayMode: .inline)
    }
}

//struct ExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseView()
//    }
//}
