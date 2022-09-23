import SwiftUI

struct ExerciseView: View {

    @StateObject var exerciseVM: ExerciseViewModel
    @State var addExerciseView = false
    @State var exerciseChanged = false
    let persistenceController: PersistenceController
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(exerciseVM.allExercises) { exercise in
                        Text(exercise.name ?? "Name")
                    }
                    .onDelete(perform: deleteExercise)
                }
                .sheet(isPresented: $addExerciseView, content: {
                    AddExerciseView(exerciseVM: exerciseVM, addExerciseView: $addExerciseView, exerciseChanged: $exerciseChanged)
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            addExerciseView.toggle()
                        }) {
                            Label("Adicionar Exercício", systemImage: "plus")
                        }
                    }
                }
                .navigationTitle("Exercícios")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            exerciseVM.allExercises = persistenceController.getAllExercises()
        }
        .onChange(of: exerciseChanged, perform: { _ in
            exerciseVM.allExercises = persistenceController.getAllExercises()
        })
    }

    func deleteExercise(of offsets: IndexSet) {
        for index in offsets {
            let exercise = exerciseVM.allExercises[index]
            persistenceController.delete(exercise)
            exerciseChanged.toggle()
        }
    }
}
