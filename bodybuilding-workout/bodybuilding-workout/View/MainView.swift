import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        entity: Workout.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Workout.name, ascending: true)]
    ) var workouts: FetchedResults<Workout>

    var body: some View {
        NavigationView {
            Button(action: {

            }, label: {
                NavigationLink(destination: WorkoutView()) {
                    Text(workouts.isEmpty ? "Criar treino": "Ir Para Treino")
                        .bold()
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
