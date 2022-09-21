//
//  ListaEditavel.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 20/09/22.
//

import UIKit



class ListaEditavel: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var DiasDeExercisios: [String:[String]] = ["Segunda": ["leg", "Braço", "21321"], "Terça": ["Cabeça", "Ombro"]]

    lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        return myTableView
    }()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DiasDeExercisios[Array(DiasDeExercisios.keys)[section]]!.count

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        DiasDeExercisios.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "\(Array(DiasDeExercisios.keys)[section])"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(DiasDeExercisios[Array(DiasDeExercisios.keys)[indexPath.section]]![indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Oi")
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

        let allKeys = Array(DiasDeExercisios.keys)

        let sourceKey = allKeys[sourceIndexPath.section]
        let destinationKey = allKeys[destinationIndexPath.section]

        let movedValue = DiasDeExercisios[sourceKey]![sourceIndexPath.row]

        DiasDeExercisios[sourceKey]!.remove(at: sourceIndexPath.row)
        DiasDeExercisios[destinationKey]!.insert(movedValue, at: destinationIndexPath.row)
//
//        let movedObject = self.DiasDeExercisios[Array(DiasDeExercisios.keys)[sourceIndexPath.section]]![sourceIndexPath.row]
//        self.DiasDeExercisios[Array(DiasDeExercisios.keys)[sourceIndexPath.section]]!.remove(at: sourceIndexPath.row)
//        self.DiasDeExercisios[Array(DiasDeExercisios.keys)[destinationIndexPath.section]]!.insert(movedObject, at: destinationIndexPath.row)
//
//        tableView.reloadData()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        DiasDeExercisios.reversed()
        view.addSubview(myTableView)
        self.myTableView.isEditing = true

        setConstraints()
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            myTableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            myTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            myTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
