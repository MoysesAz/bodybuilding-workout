import SwiftUI

struct RoutineView: View {

    @StateObject var routineVM: RoutineViewModel
    @State var addRoutineView = false
    @State var routineChanged = false
    let persistenceController: PersistenceController
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(routineVM.allRoutines) { routine in
                        Text(routine.name ?? "Name")
                    }
                    .onDelete(perform: deleteRoutine)
                }
                .sheet(isPresented: $addRoutineView, content: {
                    AddRoutineView(routineVM: routineVM, addRoutineView: $addRoutineView, routineChanged: $routineChanged)
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            addRoutineView.toggle()
                        }) {
                            Label("Adicionar Rotina", systemImage: "plus")
                        }
                    }
                }
                .navigationTitle("Rotinas")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            routineVM.allRoutines = persistenceController.getAllRoutines()
        }
        .onChange(of: routineChanged, perform: { _ in
            routineVM.allRoutines = persistenceController.getAllRoutines()
        })
    }

    func deleteRoutine(of offsets: IndexSet) {
        for index in offsets {
            let routine = routineVM.allRoutines[index]
            routineChanged.toggle()
            persistenceController.delete(routine)
        }
    }
}
