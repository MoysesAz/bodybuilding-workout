import SwiftUI

struct WorkoutView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        entity: Workout.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Workout.name, ascending: true)]
    ) var workouts: FetchedResults<Workout>
    
    var body: some View {
        VStack{
            List {
                Section(header:
                            Text("Workouts")
                    .bold()
                ){
                    ForEach(workouts, id: \.self){ workout in
                        NavigationLink(destination: RoutineDaysView(workout: workout)){
                            Text(workout.name ?? "Unknown")
                        }
                    }
                    .onDelete(perform: deleteWorkout)
                }
            }
            .navigationBarTitle("Workout", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        // fazer um campo para receber o valor de texto para nome do treino
                        addWorkout(name: "Treino1")
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    func addWorkout(name: String) {
        let workout = Workout(context: managedObjectContext)
        workout.name = name
        PersistenceController.shared.save()
    }

    func deleteWorkout(at offsets: IndexSet) {
        for index in offsets {
            let workout = workouts[index]
            PersistenceController.shared.delete(workout)
        }
    }
}

//struct Weeks_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeksViews(weekss: mock0)
//    }
//}
