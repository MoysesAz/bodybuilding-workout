//
//  Weeks.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 15/09/22.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var mock: MockCoreData
    
    var body: some View {
        VStack{
            List {
                Section(header:
                            Text("Workouts")
                    .bold()
                ){
                    ForEach(mock.workouts.indices, id: \.self){ indexWorkout in
                        NavigationLink(destination: RoutineDaysView(indexWorkout: indexWorkout)){
                            Text(mock.workouts[indexWorkout].name)
                        }
                    }
                }
            }
            .navigationBarTitle("Workout", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        mock.addWorkout(name: "Treino1")
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

//struct Weeks_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeksViews(weekss: mock0)
//    }
//}
