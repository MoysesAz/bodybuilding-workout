//
//  WorkoutsOfTheDay.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI


struct WorkoutsOfTheDay: View {
    @State var exercise: Exercise

    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        entity: Form.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Form.descriptions, ascending: true)]
    ) var forms: FetchedResults<Form>

    @State var favoriteColor: Int = 0
    var body: some View {
        let filteredForms = forms.filter({$0.ofExercise?.objectID == exercise.objectID})

        if filteredForms.count == 0 {
            Text("Add your exercise variations")
                .navigationBarTitle("Variations", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            addVariation(descriptions: "New Variation", combined: "Do it with another one", observation: "Take care with weight", repetitions: 3)
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                }
        } else {
            List {
                Section(header:
                            Text("Variations")
                    .bold()
                ){
                    Picker("Teste", selection: $favoriteColor){

                        ForEach(filteredForms, id: \.self) { form in
                            Text("\(filteredForms.count)").tag(filteredForms)
                        }
                    }.pickerStyle(.segmented)
                    Text(forms[favoriteColor].descriptions ?? "None Description here")
                    ForEach(filteredForms, id: \.self) { form in
                        Section {
                            FieldCombinado(form: form)
                            FieldRepetitions(form: form)
                            FieldObservation(form: form)
                            if favoriteColor + 1 == filteredForms.count {
                                Button(action:{
                                    deleteExercise(form: form)
                                }){
                                    Text("Finish")
                                }
                                .foregroundColor(.pink)
                                .buttonStyle(.borderless)
                            }
                        } header: {
                            Text("Variation")
                        }
                    }
                }
            }
            .navigationBarTitle(exercise.name ?? "Unknown", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        addVariation(descriptions: "New Variation", combined: "Do it with another one", observation: "Take care with weight", repetitions: 3)
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    func addVariation(descriptions: String?, combined: String?, observation: String?, repetitions: Int16?) {
        let form = Form(context: managedObjectContext)
        form.descriptions = descriptions
        form.combined = combined
        form.observation = observation
        form.repetitions = repetitions ?? 0
        form.ofExercise = exercise
        PersistenceController.shared.save()
    }
    func deleteExercise(at offsets: IndexSet) {
        for index in offsets {
            let form = forms[index]
            PersistenceController.shared.delete(form)
        }
    }
    func deleteExercise(form: Form) {
        PersistenceController.shared.delete(form)
    }
}






//struct WorkoutsOfTheDay_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutsOfTheDay(exercise: mock1)
//    }
//}
