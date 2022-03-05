//
//  ViewController.swift
//  Alert
//
//  Created by Егор Куракин on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    var number =  Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: Any) {
        number = Int.random(in: 5...10)
        numberLabel.text = "Игра началась!!!"
    }
    
    @IBAction func showButton(_ sender: Any) {
        alert(title: "Число", massage: "Введите число", style: .alert)
    }
    
    func alert(title: String, massage: String, style: UIAlertController.Style) {
        
        let alertView = UIAlertController(title: title, message: massage, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            let text = alertView.textFields?.first
            if let a = text?.text{
                if Int(a) == self.number {
                    self.numberLabel.text = "Вы выиграли: \(a)"
                }else {
                    self.numberLabel.text = "Вы не угадали"
                }
            }
            
        }
        alertView.addTextField(configurationHandler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
        
        
    }
}

