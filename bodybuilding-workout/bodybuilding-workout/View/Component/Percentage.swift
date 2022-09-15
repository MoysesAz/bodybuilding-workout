//
//  Percentage.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 14/09/22.
//

import SwiftUI

struct Percentage: View{
    var value: Float
    var body: some View{
        if value == 0 {
            Text(String(value) + "%")
                .foregroundColor(.gray)
        } else if (value > 0 && value < 70) {
            Text(String(value) + "%")
                .foregroundColor(.red)
        } else if (value >= 70 && value < 100) {
            Text(String(value) + "%")
                .foregroundColor(.green)
        } else if (value == 100) {
            Image(systemName: "flame")
                .foregroundColor(.green)
        }
    }
}
