import SwiftUI

struct RoutineCellView: View {

    @Environment(\.colorScheme) var colorScheme

    @State var routineName: String

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(colorScheme == .dark ? .white : .black), Color(colorScheme == .dark ? .white : .black).opacity(0.8)]), startPoint: .top, endPoint: .bottom)

            ZStack(alignment: .topLeading) {
                Color(colorScheme == .dark ? .black : .white).opacity(0.1)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(colorScheme == .dark ? .white : .black).opacity(0.1), radius: 10, x: 0, y: 10)

                VStack(alignment: .leading) {
                    Text("\(routineName)")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                }
                .padding(15)
                .frame(width: 200, height: 200)
                .foregroundColor(Color(colorScheme == .dark ? .black : .white).opacity(0.8))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
