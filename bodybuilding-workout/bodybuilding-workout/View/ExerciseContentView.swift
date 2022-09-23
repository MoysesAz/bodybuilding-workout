import SwiftUI
import CoreData

struct ExerciseContentView: View {
    @StateObject var exercise: Exercise
    @Binding var exerciseContentView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text(exercise.descriptions ?? "")
                            .italic()
                            .multilineTextAlignment(.center)
                    }

                    Section {
                        Text(exercise.observations ?? "")
                            .italic()
                            .multilineTextAlignment(.center)
                    }

                }
            }
            .navigationTitle(Text(exercise.name ?? ""))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//        // .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
