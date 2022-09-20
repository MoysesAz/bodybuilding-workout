////
////  Exercise.swift
////  bodybuilding-workout
////
////  Created by Moyses Miranda do Vale Azevedo on 12/09/22.
////
//
//import Foundation
//
//class Exercise {
//    var id = UUID()
//    var name: String
//    var series: Int?
//    var form: [ExerciseForm]
//    
//    init(name: String, series: Int? = nil, form: [ExerciseForm]) {
//        self.name = name
//        self.series = series
//        self.form = form
//    }
//}
//
//extension Exercise: Identifiable, Hashable  {
//    public func hash(into hasher: inout Hasher) {
//        return hasher.combine(id.uuidString)
//    }
//
//    public static func == (lhs: Exercise, rhs: Exercise) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//}
//
