//
//  RoutinesView.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct RoutineDaysView: View {
    @EnvironmentObject var mock: MockCoreData
    var indexWorkout: Int
    @State var isToggled = false

    var body: some View {
        List {
            ForEach(mock.workouts[indexWorkout].routineDays.indices, id: \.self) { indexDay in
                Section(mock.workouts[indexWorkout].routineDays[indexDay].name) {
                    ExerciseCompView(indexWorkout: indexWorkout, indexDay: indexDay)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    mock.workouts[indexWorkout].routineDays.append(RoutineDay(name: "bumm"))
                }label: {
                    Image(systemName: "plus")
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
