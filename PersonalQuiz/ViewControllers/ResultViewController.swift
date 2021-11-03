//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
    var answerChosenVC : [Answer]!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        print (answerChosenVC ?? "")
        
        var dictionary : [AnimalType: Int] = [.cat:0,.turtle:0,.rabbit:0,.dog:0]
        for answer in answerChosenVC {
            switch answer.type {
            case .cat :  do {dictionary[.cat]! += 1}
            case .dog : do {dictionary[.dog]! += 1}
            case .rabbit : do {dictionary[.rabbit]! += 1}
            case .turtle : do {dictionary[.turtle]! += 1}
            }
        }
        print (dictionary)
        guard let animalMax = (dictionary.sorted() { $0.value > $1.value }).first else { return }
        resultTitle.text = "\(animalMax.key) - \(animalMax.key.rawValue)"
        resultDescription.text = animalMax.key.definition
    }

}
