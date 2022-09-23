import Foundation
import SwiftUI

struct ExerciseDropDelegate: DropDelegate {
    @State var exercise: Exercise
    @State var exerciseVM: ExerciseViewModel

    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropEntered(info: DropInfo) {
        let fromIndex = exerciseVM.allExercises.firstIndex { (exe) -> Bool in
            return exe.objectID == exerciseVM.currentExercise?.objectID
        } ?? 0

        let toIndex = exerciseVM.allExercises.firstIndex { (exe) -> Bool in
            return exe.objectID == self.exercise.objectID
        } ?? 0

        if fromIndex != toIndex {
            withAnimation(.default) {
                let fromExercise = exerciseVM.allExercises[fromIndex]
                exerciseVM.allExercises[fromIndex] = exerciseVM.allExercises[toIndex]
                exerciseVM.allExercises[toIndex] = fromExercise
            }
        }
    }
}
