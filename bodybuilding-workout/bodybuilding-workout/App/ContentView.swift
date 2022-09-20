import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationLink {
            DataManage()
        } label: {
            Text("Click Me!")
        }

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.container.viewContext)
//    }
//}
