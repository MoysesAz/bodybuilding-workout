import CoreData

struct PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "bodybuilding_workout")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }

    func save(completion: @escaping (Error?) -> () = {_ in }) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }

    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }

    func getAllExercises () -> [Exercise] {
        let fetchRequest: NSFetchRequest<Exercise> = Exercise.fetchRequest()

        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            print("failed to fetch: \(error)")
            return []
        }
    }

    func getAllRoutines () -> [Routine] {
        let fetchRequest: NSFetchRequest<Routine> = Routine.fetchRequest()

        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            print("failed to fetch: \(error)")
            return []
        }
    }
}
