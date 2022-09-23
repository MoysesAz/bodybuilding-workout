import Foundation
import SwiftUI
import CoreData

class ExerciseViewModel: ObservableObject {

    @Published var exerciseName = ""
    @Published var exerciseObservations = ""
    @Published var exerciseDescriptions = ""
    @Published var currentExercise: Exercise?

    @Published var allExercises: [Exercise] = []

}

extension ExerciseViewModel {

    func createExercise(_ context: NSManagedObjectContext) {
        let newExercise = Exercise(context: context)
        newExercise.name = exerciseName
        newExercise.observations = exerciseObservations
        newExercise.descriptions = exerciseDescriptions

        PersistenceController.shared.save()
    }

    func updateExercise(_ exercise1: Exercise, _ exercise2: Exercise) {
        exercise1.name = exercise2.name
        exercise1.observations = exercise2.observations
        exercise1.descriptions = exercise2.descriptions
    }
}
