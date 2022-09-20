import SwiftUI

struct RoutineDaysView: View {

    @State var workout: Workout

    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        entity: RoutineDays.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \RoutineDays.name, ascending: true)]
    ) var routines: FetchedResults<RoutineDays>

    var body: some View {
        let filteredRoutine = routines.filter({$0.ofWorkout?.objectID == workout.objectID})
        List {
            Section(header:
                        Text("Week")
                .bold()
            ){
                ForEach(filteredRoutine, id: \.self){ routine in
                    NavigationLink(destination: ExerciseCompView(routine: routine)){
                        Text(routine.name ?? "Unknown")
                    }
                }
                .onDelete(perform: deleteRoutine)
            }
        }
        .navigationBarTitle("Week", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    addRoutine(name: "New Routine")
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    func addRoutine(name: String) {
        let routine = RoutineDays(context: managedObjectContext)
        routine.name = name
        routine.ofWorkout = workout
        PersistenceController.shared.save()
    }

    func deleteRoutine(at offsets: IndexSet) {
        for index in offsets {
            let routine = routines[index]
            PersistenceController.shared.delete(routine)
        }
    }
}

//
//struct RoutinesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoutinesView()
//    }
//}
