import SwiftUI

struct ExerciseCompView: View {

    @State var routine: RoutineDays

    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        entity: Exercise.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Exercise.name, ascending: true)]
    ) var exercises: FetchedResults<Exercise>

    var body: some View {
        let filteredExercise = exercises.filter({$0.routineDays?.objectID == routine.objectID})
        List {
            Section(header:
                        Text("Exercises")
                .bold()
            ){
                ForEach(filteredExercise, id: \.self){ exercise in
                    NavigationLink(destination: WorkoutsOfTheDay(exercise: exercise)){
                        Text(exercise.name ?? "Unknown")
                    }
                }
                .onDelete(perform: deleteExercise)
            }
        }
        .navigationBarTitle("Exercises", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    addExercise(name: "New Exercise")
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
    }

    func addExercise(name: String) {
        let exercise = Exercise(context: managedObjectContext)
        exercise.name = name
        exercise.routineDays = routine
        PersistenceController.shared.save()
    }

    func deleteExercise(at offsets: IndexSet) {
        for index in offsets {
            let exercise = exercises[index]
            PersistenceController.shared.delete(exercise)
        }
    }

}

//struct ExerciseCompView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseCompView()
//    }
//}
