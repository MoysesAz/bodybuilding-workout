import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme

    @StateObject var homeVM = HomeViewModel()

    @Namespace var animation
    @State private var title = "Rotinas"

    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)

    @StateObject var exerciseVM: ExerciseViewModel

    @StateObject var routineVM: RoutineViewModel

    @State var persistenceController = PersistenceController()

    // testable

    @State var exerciseContentView = false
    @State var routineContentView = false

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 50)
            if homeVM.selectedTab == "Exercise" {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5, content:  {
                        ForEach(exerciseVM.allExercises) { exercise in
                            Button {
                                exerciseContentView.toggle()
                            } label: {
                                ExerciseCellView(exerciseName: exercise.name ?? "Unknown")
                                    .frame(height: 150)
                                    .cornerRadius(15)
                                    .scaleEffect(x:0.8, y:0.8)
                                    .onDrag ({
                                        exerciseVM.currentExercise = exercise
                                        return NSItemProvider(contentsOf: URL(string: "\(exercise.name ?? "Unknown")"))!
                                    })
                                    .onDrop(of: [.message], delegate: ExerciseDropDelegate(exercise: exercise, exerciseVM: exerciseVM))
                                    .onTapGesture {
                                        exerciseVM.currentExercise = exercise
                                        exerciseContentView.toggle()
                                    }
                                    .sheet(isPresented: $exerciseContentView) {
                                        ExerciseContentView(exercise: exerciseVM.currentExercise!, exerciseContentView: $exerciseContentView)
                                    }
                            }
                        }
                    })
                }
                .onAppear {
                    exerciseVM.allExercises = persistenceController.getAllExercises()
                }
//                .padding(.top, 10)
                HStack {
                    Text("Day")
                        .font(.system(size: 24))
                        .foregroundColor(colorScheme == .dark ? (homeVM.selectedTab == "Routine" ? .black : .white) : (homeVM.selectedTab == "Routine" ? .white : .black))
                        .frame(width: 70, height: 40)
                        .background(
                            ZStack {
                                if homeVM.selectedTab != "Routine" {
                                    Color.clear
                                } else {
                                    Color(colorScheme == .dark ? .white : .black)
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                }
                            }
                        )
                        .onTapGesture {
                            withAnimation {
                                homeVM.selectedTab = "Routine"
                                title = "Rotinas"
                            }
                        }

                    Text("Exe")
                        .font(.system(size: 24))
                        .foregroundColor(colorScheme == .dark ? (homeVM.selectedTab == "Exercise" ? .black : .white) : (homeVM.selectedTab == "Exercise" ? .white : .black))
                        .frame(width: 70, height: 40)
                        .background(
                            ZStack {
                                if homeVM.selectedTab != "Exercise" {
                                    Color.clear
                                } else {
                                    Color(colorScheme == .dark ? .white : .black)
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                }
                            }
                        )
                        .onTapGesture {
                            withAnimation {
                                homeVM.selectedTab = "Exercise"
                                title = "Exercícios"
                            }
                        }
                }
                .background(colorScheme == .dark ? .white.opacity(0.25) : .black.opacity(0.25))
                .cornerRadius(15)
                .padding(.bottom, 50)
            }
            if homeVM.selectedTab == "Routine" {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5, content:  {
                        ForEach(routineVM.allRoutines) { routine in
                            Button {
                                routineContentView.toggle()
                            } label: {
                                RoutineCellView(routineName: routine.name ?? "Unknown")
                                    .frame(height: 150)
                                    .cornerRadius(15)
                                    .scaleEffect(x:0.8, y:0.8)
                                    .onDrag ({
                                        routineVM.currentRoutine = routine
                                        return NSItemProvider(contentsOf: URL(string: "\(routine.name ?? "Unknown")"))!
                                    })
                                    .onDrop(of: [.message], delegate: RoutineDropDelegate(routine: routine, routineVM: routineVM))
                                    .onTapGesture {
                                        routineVM.currentRoutine = routine
                                        routineContentView.toggle()
                                    }
                                    .sheet(isPresented: $routineContentView) {
                                        RoutineContentView(routine: routineVM.currentRoutine!, routineContentView: $routineContentView)
                                    }
                            }
                        }
                    })
                }
                .onAppear {
                    routineVM.allRoutines = persistenceController.getAllRoutines()
                }
//                .padding(.top, 10)
                HStack {
                    Text("Day")
                        .font(.system(size: 24))
                        .foregroundColor(colorScheme == .dark ? (homeVM.selectedTab == "Routine" ? .black : .white) : (homeVM.selectedTab == "Routine" ? .white : .black))
                        .frame(width: 70, height: 40)
                        .background(
                            ZStack {
                                if homeVM.selectedTab != "Routine" {
                                    Color.clear
                                } else {
                                    Color(colorScheme == .dark ? .white : .black)
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                }
                            }
                        )
                        .onTapGesture {
                            withAnimation {
                                homeVM.selectedTab = "Routine"
                                title = "Rotinas"
                            }
                        }

                    Text("Exe")
                        .font(.system(size: 24))
                        .foregroundColor(colorScheme == .dark ? (homeVM.selectedTab == "Exercise" ? .black : .white) : (homeVM.selectedTab == "Exercise" ? .white : .black))
                        .frame(width: 70, height: 40)
                        .background(
                            ZStack {
                                if homeVM.selectedTab != "Exercise" {
                                    Color.clear
                                } else {
                                    Color(colorScheme == .dark ? .white : .black)
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                }
                            }
                        )
                        .onTapGesture {
                            withAnimation {
                                homeVM.selectedTab = "Exercise"
                                title = "Exercícios"
                            }
                        }
                }
                .background(colorScheme == .dark ? .white.opacity(0.25) : .black.opacity(0.25))
                .cornerRadius(15)
                .padding(.bottom, 50)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colorScheme == .dark ? .black : .white).ignoresSafeArea(.all, edges: .all)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
