import Foundation
import SwiftUI
import CoreData

class RoutineViewModel: ObservableObject {

    @Published var routineName = ""
    @Published var allRoutines: [Routine] = []
    @Published var currentRoutine: Routine?


}

extension RoutineViewModel {

    func createRoutine(_ context: NSManagedObjectContext) {
        let newRoutine = Routine(context: context)
        newRoutine.name = routineName
        PersistenceController.shared.save()
    }

    func updateExercise(_ routine1: Routine, _ routine2: Routine) {
        routine1.name = routine2.name
    }
}
