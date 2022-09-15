//
//  Main.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 12/09/22.
//

import SwiftUI

struct MainView: View {
    @State var mock = mockDeus
    var body: some View {
        NavigationView {
            Button(action: {
            }, label: {
                if mock.isEmpty {
                    NavigationLink(destination: ContentView()) {
                        Text("Criar treino")
                            .bold()
                    }
                } else {
                    NavigationLink(destination: WorkoutView(workouts: $mock)) {
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
