import SwiftUI

@main
struct bodybuilding_workoutApp: App {

    let persistenceController = PersistenceController.shared

    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("Background.")
                persistenceController.save()
            case .inactive:
                print("Inactive Mode.")
            case .active:
                print("Active Mode.")
            @unknown default:
                print("Search for some changes made by apple.")
            }
        }
    }
}
