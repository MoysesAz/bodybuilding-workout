import Foundation
import SwiftUI

struct RoutineDropDelegate: DropDelegate {
    @State var routine: Routine
    @State var routineVM: RoutineViewModel
    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropEntered(info: DropInfo) {
        let fromIndex = routineVM.allRoutines.firstIndex { (rou) -> Bool in
            return rou.objectID == routineVM.currentRoutine?.objectID
        } ?? 0

        let toIndex = routineVM.allRoutines.firstIndex { (rou) -> Bool in
            return rou.objectID == self.routine.objectID
        } ?? 0

        if fromIndex != toIndex {
            withAnimation(.default) {
                let fromRoutine = routineVM.allRoutines[fromIndex]
                routineVM.allRoutines[fromIndex] = routineVM.allRoutines[toIndex]
                routineVM.allRoutines[toIndex] = fromRoutine
            }
        }
    }
}
