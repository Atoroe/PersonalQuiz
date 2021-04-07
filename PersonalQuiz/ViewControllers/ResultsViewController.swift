//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var answersChoosen: [Answer] = []
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        setLabel()
    }
    
    private func mostFrequent(from answers: [Answer]) -> AnimalType? {
        var counts = [Character : Int]()
        answers.forEach { counts[$0.type.rawValue] = (counts[$0.type.rawValue] ?? 0) + 1 }
        print("сортированный массив \(counts)")
        if let (value, _) = counts.max(by: {$0.1 < $1.1}) {
            switch value {
            case AnimalType.dog.rawValue:
                return AnimalType.dog
            case AnimalType.cat.rawValue:
                return AnimalType.cat
            case AnimalType.rabbit.rawValue:
                return AnimalType.rabbit
            case AnimalType.turtle.rawValue:
                return AnimalType.turtle
            default:
                return nil
            }
        }
        return nil
    }
    
    private func setLabel() {
        if let result = mostFrequent(from: answersChoosen) {
            emojiLabel.text = "Вы - \(result.rawValue)"
            descriptionLabel.text = result.definition
        }
    }
    
}
