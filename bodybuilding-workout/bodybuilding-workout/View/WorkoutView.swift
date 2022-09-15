//
//  Weeks.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct WorkoutView: View {
    @Binding var workouts: [Workout]

    var body: some View {
        List {
            Section(header:
                        Text("Workouts")
                .bold()
            ){
                ForEach($workouts, id: \.self){ $workout in
                    NavigationLink(destination: RoutineDaysView(routineDays: $workout.routineDays)){
                        HStack{
                            Text(workout.name)
                            Spacer()
                            Percentage(value: 35)
                        }
                    }
                }
            }
        }.navigationBarTitle("Workout", displayMode: .inline)
    }
}

//struct Weeks_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeksViews(weekss: mock0)
//    }
//}
