//
//  ProgressCount.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 22/09/22.
//

import Foundation
import SwiftUI

struct ProgressCount: View {
    init(fuctionTimer: TimeInterval, myPercentage: Int, percentage: Int) {
        self.timer = Timer.publish(every: fuctionTimer, on: .main, in: .common)
        self.myPercentage = myPercentage
        self.percentage = percentage
        var _ = self.timer.connect()
    }

    @GestureState private var isTapped = false
    @State var percentage: Int
    @State var myPercentage: Int
    var timer: Timer.TimerPublisher

    var body: some View {
        let tap = DragGesture(minimumDistance: 0)
            .updating($isTapped) { (_, isTapped, _) in
                isTapped = true
            }

        VStack{
            Text("\(percentage) %")
                .foregroundColor(percentage < 50 ? .red : (percentage == 100 ? .yellow : .green))
                .onReceive(timer) { _ in
                    if isTapped == true && percentage < 100 && myPercentage > 0{
                        percentage += 1
                        myPercentage -= 1
                    }
                }
            Text("Tap me!")
                        .foregroundColor(isTapped ? .red: .black)
                        .gesture(tap)
        }
    }

}

