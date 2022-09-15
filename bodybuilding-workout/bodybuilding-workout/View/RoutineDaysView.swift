//
//  RoutinesView.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct RoutineDaysView: View {
    @Binding var routineDays: [RoutineDays]
    var body: some View {
        List {
            ForEach($routineDays, id: \.self) { $routine in
                Section(routine.name) {
                    ExerciseCompView(exercises: $routine.exercices)
                }
            }
        }
//        .listStyle(SidebarListStyle())
//        List {
//            Section(header:
//                        Text("Routines")
//                .bold()
//            ){
//                ForEach($routineDays, id: \.self){ $routineDay in
//                    NavigationLink(destination: ExerciseView(exercises: $routineDay.exercices)){
//                        HStack{
//                            Text(routineDay.name)
//                            Spacer()
//                            Percentage(value: 35)
//                        }
//                    }
//                }
//            }
//        }.navigationBarTitle("Routine Days", displayMode: .inline)

    }
}

//
//struct RoutinesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoutinesView()
//    }
//}
