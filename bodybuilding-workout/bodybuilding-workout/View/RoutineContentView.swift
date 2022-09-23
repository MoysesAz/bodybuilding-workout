import SwiftUI
import CoreData

struct RoutineContentView: View {
    @StateObject var routine: Routine
    @Binding var routineContentView: Bool

    var body: some View {
        NavigationView {
            VStack {
                Text(routine.name!)
            }
            .navigationTitle(Text(routine.name ?? ""))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
