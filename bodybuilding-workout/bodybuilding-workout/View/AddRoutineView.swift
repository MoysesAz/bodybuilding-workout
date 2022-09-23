import SwiftUI

struct AddRoutineView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State var routineVM: RoutineViewModel
    @Binding var addRoutineView: Bool
    @Binding var routineChanged: Bool
    @State private var name = ""
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Nome do Rotina", text: $name)
                    } header: {
                        Text("Rotina")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)
                    Button(action: {
                        attashAction()
                    }) {
                        Text("Adicionar Routina")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle)
                    .padding()
                }
            }
            .navigationTitle("Adicionar Rotina")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func attashAction() {
        routineVM.routineName = name
        routineVM.createRoutine(viewContext)
        addRoutineView.toggle()
        routineChanged.toggle()
    }
}

