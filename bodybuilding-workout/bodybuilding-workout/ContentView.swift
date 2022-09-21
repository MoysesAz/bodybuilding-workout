//
//  ContentView.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 12/09/22.
//

import SwiftUI
import UIKit
import CoreData

struct ContentView: View {
    var body: some View {
        VStack{
            Vinho()
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Vinho: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ListaEditavel {
        let teste = ListaEditavel()
        return teste
    }

    func updateUIViewController(_ uiViewController: ListaEditavel, context: Context) {

    }

    typealias UIViewControllerType = ListaEditavel
}


struct ReferenceConstraints {
    var centerXAnchor: NSLayoutConstraint?
    var centerYAnchor: NSLayoutConstraint?
    var leadingAnchor: NSLayoutConstraint?
    var trailingAnchor: NSLayoutConstraint?
    var leftAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?
    var topAnchor: NSLayoutConstraint?
    var bottomAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    var widthAnchor: NSLayoutConstraint?
}

class PropertyViewAnimator: UIViewController {

    var animation:  UIViewPropertyAnimator!

    var countAnimation = 0

    lazy private var view1: UIView = {
        let view1 = UIView(frame: .zero)
        view1.backgroundColor = .systemPink
        view1.isUserInteractionEnabled = true
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()

    lazy var view1Constraints = ReferenceConstraints()

    private lazy var start: UIButton = {
        let start = UIButton(type: .system)
        start.setTitle("start", for: .normal)
        start.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        start.translatesAutoresizingMaskIntoConstraints = false
        return start
    }()

    private lazy var pause: UIButton = {
        let pause = UIButton(type: .system)
        pause.setTitle("pause", for: .normal)
        pause.addTarget(self, action: #selector(pauseAnimation), for: .touchUpInside)
        pause.translatesAutoresizingMaskIntoConstraints = false
        return pause
    }()

    private lazy var stop: UIButton = {
        let stop = UIButton(type: .system)
        stop.setTitle("stop", for: .normal)
        stop.addTarget(self, action: #selector(stopAnimation), for: .touchUpInside)
        stop.translatesAutoresizingMaskIntoConstraints = false
        return stop
    }()

    private lazy var reset: UIButton = {
        let reset = UIButton(type: .system)
        reset.setTitle("reset", for: .normal)
//        reset.addTarget(self, action: #selector(resetAnimation), for: .touchUpInside)
        reset.translatesAutoresizingMaskIntoConstraints = false
        return reset
    }()

    private lazy var reverse: UIButton = {
        let reverse = UIButton(type: .system)
        reverse.setTitle("reverse", for: .normal)
        reverse.addTarget(self, action: #selector(changeAnimation), for: .touchUpInside)
        reverse.translatesAutoresizingMaskIntoConstraints = false
        return reverse
    }()

    lazy private var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            start, pause, stop, reset, reverse
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    @objc func startAnimation(){
        changeAnimation()
        animation.startAnimation()
    }

    @objc func pauseAnimation(){
        animation.pauseAnimation()
    }

    @objc func stopAnimation(){
        animation.stopAnimation(false)
        animation.finishAnimation(at: .current)

    }

    @objc func changeAnimation(){
        if countAnimation == 0 {
            self.leftToRightIn()
            countAnimation = 1
        } else if countAnimation == 1 {
            self.puttingWeight()
            countAnimation = 2
        } else if countAnimation == 2 {
            self.rotationView1Right()
            countAnimation = 3
        } else if countAnimation == 3 {
            self.rotationView1Left()
            countAnimation = 4
        } else if countAnimation == 4 {
            self.takingWeight()
            countAnimation = 5
        } else if countAnimation == 5 {
            self.LeftToRightOut()
            countAnimation = 6

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(view1)
        view.addSubview(stackView)
        setConstraints()
    }



    @objc func rotationView1Right() {
        animation = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.view1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        })
    }

    @objc func rotationView1Left() {
        animation = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.view1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        })
    }

    @objc func takingWeight() {
        animation = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {

            NSLayoutConstraint.deactivate([
                self.view1Constraints.heightAnchor!,
                self.view1Constraints.widthAnchor!
            ])

            self.view1Constraints.heightAnchor = self.view1.heightAnchor.constraint(equalTo: self.view.heightAnchor,  multiplier: 0.3)
            self.view1Constraints.widthAnchor = self.view1.widthAnchor.constraint(equalTo: self.view.heightAnchor,  multiplier: 0.3)


            NSLayoutConstraint.activate([
                self.view1Constraints.heightAnchor!,
                self.view1Constraints.widthAnchor!

            ])
            self.view1.backgroundColor = UIColor.systemPink

            self.view.layoutIfNeeded()
        })
    }

    @objc func puttingWeight(){
        animation = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {

            NSLayoutConstraint.deactivate([
                self.view1Constraints.heightAnchor!,
                self.view1Constraints.widthAnchor!
            ])

            self.view1Constraints.heightAnchor = self.view1.heightAnchor.constraint(equalTo: self.view.heightAnchor,  multiplier: 0.25)
            self.view1Constraints.widthAnchor = self.view1.widthAnchor.constraint(equalTo: self.view.heightAnchor,  multiplier: 0.25)


            NSLayoutConstraint.activate([
                self.view1Constraints.heightAnchor!,
                self.view1Constraints.widthAnchor!

            ])
            self.view1.backgroundColor = UIColor.systemPink

            self.view.layoutIfNeeded()
        })
    }


    @objc func leftToRightIn(){
        animation = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {

            NSLayoutConstraint.deactivate([
                self.view1Constraints.centerXAnchor!
            ])

            self.view1Constraints.centerXAnchor = self.view1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)

            NSLayoutConstraint.activate([
                self.view1Constraints.centerXAnchor!
            ])
            self.view1.backgroundColor = UIColor.systemPink

            self.view.layoutIfNeeded()
        })
    }

    @objc func LeftToRightOut(){
        animation = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {

            NSLayoutConstraint.deactivate([
                self.view1Constraints.centerXAnchor!
            ])

            self.view1Constraints.centerXAnchor = self.view1.centerXAnchor.constraint(equalTo: self.view.trailingAnchor, constant: self.view.frame.width/2)

            NSLayoutConstraint.activate([
                self.view1Constraints.centerXAnchor!
            ])
            self.view1.backgroundColor = UIColor.systemPink

            self.view.layoutIfNeeded()
        })
    }
    private func setConstraints(){
        setConstraintView1()
        setConstraintStackView()
    }

    private func setConstraintView1(){
        view1Constraints.centerYAnchor = view1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        view1Constraints.centerXAnchor = view1.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: -view.frame.width / 2)
        view1Constraints.heightAnchor = view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        view1Constraints.widthAnchor = view1.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)

        NSLayoutConstraint.activate([
            view1Constraints.centerXAnchor!,
            view1Constraints.centerYAnchor!,
            view1Constraints.heightAnchor!,
            view1Constraints.widthAnchor!,
        ])
    }


    private func setConstraintStackView(){
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}


