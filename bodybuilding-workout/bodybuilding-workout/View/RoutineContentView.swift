import SwiftUI
import CoreData

struct RoutineContentView: View {

    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.colorScheme) var colorScheme

    @State var routine: Routine
    @Binding var routineContentView: Bool
    @State var exerciseVM: ExerciseViewModel
    @State var selectedExe: Exercise
    @State private var filteredExe: [Exercise] = []
    @State private var tempFilteredExe: [Exercise] = []
    @State private var routineExes: [Exercise] = []
    @State var isSettable = false

    var body: some View {
        NavigationView {
            VStack {
                Text("List of Workouts")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .multilineTextAlignment(.center)
                    .padding(10)

                List{
                    ForEach(routineExes) { exe in
                            Text(exe.name ?? "Empty Name")
                    }
                    .onDelete(perform: deleteExeToRoutine)
                }
                .listStyle(.insetGrouped)
                
                VStack {
                    Form {
                        Section {
                            Text("Select your Exercise")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                        Picker(
                            "Select: ",
                            selection: $selectedExe
                        ) {
                            ForEach(filteredExe) { exe in
                                Text(exe.name!).tag(exe as Exercise)
                            }
                        }
                        .pickerStyle(.menu)
                        Section {
                            Button {
                                isSettable.toggle()
                            } label: {
                                Text("Add Workouts")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                            }
                            .buttonStyle(.borderless)
                            .buttonBorderShape(.roundedRectangle)
                            .padding()
                        }
                    }
                }
            }
            .onChange(of: isSettable, perform: { _ in
                routineExes.append(selectedExe)
                adjustingFiltered()
                selectedExe = filteredExe.first!
            })
            .navigationTitle(Text(routine.name ?? ""))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            filteredExe = exerciseVM.allExercises
            tempFilteredExe = exerciseVM.allExercises.filter( { $0.ofRoutine?.objectID != routine.objectID } )
            routineExes = exerciseVM.allExercises.filter( { $0.ofRoutine?.objectID == routine.objectID } )
        }
        .onDisappear {
            attashExeToRoutine(routineExes)
        }
    }

    func attashExeToRoutine(_ list: [Exercise]) {
        for exercise in list {
            exercise.ofRoutine = routine
        }
        PersistenceController.shared.save()
    }
    func deleteExeToRoutine(of offsets: IndexSet) {
        routineExes.remove(atOffsets: offsets)
        adjustingFiltered()
    }
    func adjustingFiltered() {
        filteredExe = tempFilteredExe.filter({index in !routineExes.contains(index) })
    }
}
