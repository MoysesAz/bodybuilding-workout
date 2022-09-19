//
//  Main.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 12/09/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mock: MockCoreData

    var body: some View {
        NavigationView {
            Button(action: {
            }, label: {
                if mock.workouts.isEmpty {
                    NavigationLink(destination: WorkoutView()) {
                        Text("Criar treino")
                            .bold()
                    }

                } else {
                    NavigationLink(destination: WorkoutView()) {
                        Text("Ir Para Treino")
                            .bold()
                    }
                }
            })

        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
