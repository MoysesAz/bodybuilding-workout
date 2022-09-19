//
//  WorkoutsOfTheDay.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI


struct WorkoutsOfTheDay: View {
    @EnvironmentObject var mock: MockCoreData
    @Binding var exercise: Exercise
    @State private var favoriteColor = 0

    var body: some View{
        List {
            Section(header:
                        Text("Variations")
                .bold()
            ){
                Picker("Teste", selection: $favoriteColor){

                    ForEach(exercise.form.indices, id: \.self) {index in
                        Text("\(index + 1)").tag(index)
                    }

                }.pickerStyle(.segmented)
                Text(exercise.form[favoriteColor].description ?? "")
            }

            FieldCombinado(exercise: $exercise, favoriteColor: $favoriteColor)
            FieldRepetitions(exercise: $exercise, favoriteColor: $favoriteColor)
            FieldObservation(exercise: $exercise, favoriteColor: $favoriteColor)



            if favoriteColor + 1 == exercise.form.count {
                Button(action:{
                }){
                    Text("Finish")
                }
                .foregroundColor(.pink)
                .buttonStyle(.borderless)
            }

            
        }.navigationBarTitle(exercise.name, displayMode: .inline)


    }


}






//struct WorkoutsOfTheDay_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutsOfTheDay(exercise: mock1)
//    }
//}
