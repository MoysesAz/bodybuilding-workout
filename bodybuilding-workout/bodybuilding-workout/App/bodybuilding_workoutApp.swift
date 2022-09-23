import SwiftUI

@main
struct bodybuilding_workoutApp: App {
    
    let persistenceController = PersistenceController.shared

    @StateObject var exerciseVM = ExerciseViewModel()
    @StateObject var routineVM = RoutineViewModel()


    var body: some Scene {
        WindowGroup {
            HomeView(exerciseVM: exerciseVM, routineVM: routineVM, persistenceController: persistenceController)
//            ExerciseView(exerciseVM: exerciseVM, persistenceController: persistenceController)
//            RoutineView(routineVM: routineVM, persistenceController: persistenceController)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(exerciseVM)
                .environmentObject(routineVM)
        }
    }
}
