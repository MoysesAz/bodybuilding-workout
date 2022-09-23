import SwiftUI

struct AddExerciseView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State var exerciseVM: ExerciseViewModel
    @Binding var addExerciseView: Bool
    @Binding var exerciseChanged: Bool
    @State private var name = ""
    @State private var observations = ""
    @State private var descriptions = ""
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Nome do Exercício", text: $name)
                    } header: {
                        Text("Exercício")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)

                    Section {
                        TextField("Descrição do Exercício", text: $descriptions)
                    } header: {
                        Text("Descrição")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)

                    Section {
                        TextField("Observações", text: $observations)
                    } header: {
                        Text("Observações")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)

                    Button(action: {
                        attashAction()
                    }) {
                        Text("Adicionar Exercício")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle)
                    .padding()
                }
            }
            .navigationTitle("Adicionar Exercício")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func attashAction() {
        exerciseVM.exerciseName = name
        exerciseVM.exerciseDescriptions = descriptions
        exerciseVM.exerciseObservations = observations
        exerciseVM.createExercise(viewContext)
        addExerciseView.toggle()
        exerciseChanged.toggle()
    }
}
